using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class BookReturnTable
{
    public int BookReturnId { get; set; }

    public int BookId { get; set; }

    public int EmployeeId { get; set; }

    public DateTime ReturnDate { get; set; }

    public DateTime CurrentDate { get; set; }

    public int UserId { get; set; }

    public virtual BookTable Book { get; set; } = null!;

    public virtual EmployeeTable Employee { get; set; } = null!;

    public virtual UserTable User { get; set; } = null!;
}
