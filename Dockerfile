FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8082

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["EnrollmentManagement/EnrollmentManagement.csproj", "EnrollmentManagement/"]
RUN dotnet restore "EnrollmentManagement/EnrollmentManagement.csproj"
COPY . .
WORKDIR "/src/EnrollmentManagement"
RUN dotnet build "EnrollmentManagement.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "EnrollmentManagement.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "EnrollmentManagement.dll"]
