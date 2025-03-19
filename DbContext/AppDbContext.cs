using Microsoft.EntityFrameworkCore;
using EnrollmentManagement.Models;

namespace EnrollmentManagement.DbContext;

public class AppDbContext : Microsoft.EntityFrameworkCore.DbContext
{
    private readonly string _schema;

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public DbSet<Enrollment> Enrollments { get; set; }
    
}