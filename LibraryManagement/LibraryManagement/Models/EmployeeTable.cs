using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class EmployeeTable
{
    public int EmployeeId { get; set; }

    public int UserId { get; set; }

    public string FullName { get; set; } = null!;

    public string ContactNo { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Address { get; set; } = null!;

    public bool IsActive { get; set; }

    public string? Description { get; set; }

    public string? ImageU { get; set; }

    public virtual ICollection<BookFineTable> BookFineTables { get; set; } = new List<BookFineTable>();

    public virtual ICollection<BookReturnTable> BookReturnTables { get; set; } = new List<BookReturnTable>();

    public virtual ICollection<IssueBookTable> IssueBookTables { get; set; } = new List<IssueBookTable>();

    public virtual ICollection<UserTable> UserTables { get; set; } = new List<UserTable>();
}
