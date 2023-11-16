using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class CartTable
{
    public int CartId { get; set; }

    public int BookId { get; set; }

    public string BookName { get; set; } = null!;

    public virtual BookTable Book { get; set; } = null!;
}
