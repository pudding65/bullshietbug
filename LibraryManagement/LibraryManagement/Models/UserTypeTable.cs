using System;
using System.Collections.Generic;

namespace LibraryManagement.Models;

public partial class UserTypeTable
{
    public int UserTypeId { get; set; }

    public string UserType { get; set; } = null!;

    public virtual ICollection<UserTable> UserTables { get; set; } = new List<UserTable>();
}
