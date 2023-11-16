using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class BookFineTable
{
    public int BookFineId { get; set; }

    public int EmployeeId { get; set; }

    public int BookId { get; set; }

    public int UserId { get; set; }

    public DateTime FineDate { get; set; }

    public double FineAmount { get; set; }

    public double? ReceiveAmount { get; set; }

    public int NoOfDays { get; set; }

    public virtual BookTable Book { get; set; } = null!;

    public virtual EmployeeTable Employee { get; set; } = null!;

    public virtual UserTable User { get; set; } = null!;
}
