using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class IssueBookTable
{
    public int IssueBookId { get; set; }

    public int UserId { get; set; }

    public int BookId { get; set; }

    public int EmployeeId { get; set; }

    public int IssueCopies { get; set; }

    public DateTime IssueDate { get; set; }

    public DateTime ReturnDate { get; set; }

    public bool Status { get; set; }

    public string? Description { get; set; }

    public bool ReserveNoOfCopies { get; set; }

    public virtual BookTable Book { get; set; } = null!;

    public virtual EmployeeTable Employee { get; set; } = null!;

    public virtual UserTable User { get; set; } = null!;
}
