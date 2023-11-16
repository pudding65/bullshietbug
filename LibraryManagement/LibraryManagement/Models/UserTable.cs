using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class UserTable
{
    public int UserId { get; set; }

    public int UserTypeId { get; set; }

    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int? EmployeeId { get; set; }

    public bool? IsActive { get; set; }

    public string? Image { get; set; }

    public virtual ICollection<BookFineTable> BookFineTables { get; set; } = new List<BookFineTable>();

    public virtual ICollection<BookReturnTable> BookReturnTables { get; set; } = new List<BookReturnTable>();

    public virtual ICollection<BookTable> BookTables { get; set; } = new List<BookTable>();

    public virtual EmployeeTable? Employee { get; set; }

    public virtual ICollection<IssueBookTable> IssueBookTables { get; set; } = new List<IssueBookTable>();

    public virtual ICollection<PublisherTable> PublisherTables { get; set; } = new List<PublisherTable>();

    public virtual UserTypeTable UserType { get; set; } = null!;
}
