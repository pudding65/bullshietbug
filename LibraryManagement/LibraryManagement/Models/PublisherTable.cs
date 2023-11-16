using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class PublisherTable
{
    public int PublisherId { get; set; }

    public string PublisherName { get; set; } = null!;

    public int UserId { get; set; }

    public string ContactNo { get; set; } = null!;

    public string? Email { get; set; }

    public string? Description { get; set; }

    public virtual UserTable User { get; set; } = null!;
}
