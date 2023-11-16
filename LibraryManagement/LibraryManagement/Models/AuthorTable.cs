using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class AuthorTable
{
    public int AuthorId { get; set; }

    public string AuthorName { get; set; } = null!;

    public DateTime? DateOfBirth { get; set; }

    public DateTime? DateOfDeath { get; set; }

    public string? Image { get; set; }

    public virtual ICollection<BookTable> BookTables { get; set; } = new List<BookTable>();
}
