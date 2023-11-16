using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class BookTable
{
    public int BookId { get; set; }

    public int UserId { get; set; }

    public int BookTypeId { get; set; }

    public int AuthorId { get; set; }

    public string BookTitle { get; set; } = null!;

    public string ShortDescription { get; set; } = null!;

    public string Author { get; set; } = null!;

    public string BookName { get; set; } = null!;

    public double Edition { get; set; }

    public int TotalCopies { get; set; }

    public DateTime RegDate { get; set; }

    public string? Description { get; set; }

    public int PublisherId { get; set; }

    public string? Image { get; set; }

    public virtual AuthorTable AuthorNavigation { get; set; } = null!;

    public virtual ICollection<BookFineTable> BookFineTables { get; set; } = new List<BookFineTable>();

    public virtual ICollection<BookReturnTable> BookReturnTables { get; set; } = new List<BookReturnTable>();

    public virtual BookTypeTable BookType { get; set; } = null!;

    public virtual ICollection<CartTable> CartTables { get; set; } = new List<CartTable>();

    public virtual ICollection<IssueBookTable> IssueBookTables { get; set; } = new List<IssueBookTable>();

    public virtual UserTable User { get; set; } = null!;
}
