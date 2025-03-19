using System.ComponentModel.DataAnnotations;

namespace EnrollmentManagement.Models;

public class Enrollment
{
    public int Id { get; set; }

    [Required]
    public int StudentId { get; set; }

    [Required]
    public int CourseId { get; set; }

    [Required]
    public DateTime EnrollmentDate { get; set; }

    [Required]
    [MaxLength(50)]
    public string UniversityBranch { get; set; }
}

