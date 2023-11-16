using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class BookTypeTable
{
    public int BookTypeId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<BookTable> BookTables { get; set; } = new List<BookTable>();
}
