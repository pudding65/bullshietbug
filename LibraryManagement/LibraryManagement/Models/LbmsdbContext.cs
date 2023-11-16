using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagement.Models;

public partial class LbmsdbContext : DbContext
{
    public LbmsdbContext()
    {
    }

    public LbmsdbContext(DbContextOptions<LbmsdbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AuthorTable> AuthorTables { get; set; }

    public virtual DbSet<BookFineTable> BookFineTables { get; set; }

    public virtual DbSet<BookReturnTable> BookReturnTables { get; set; }

    public virtual DbSet<BookTable> BookTables { get; set; }

    public virtual DbSet<BookTypeTable> BookTypeTables { get; set; }

    public virtual DbSet<CartTable> CartTables { get; set; }

    public virtual DbSet<EmployeeTable> EmployeeTables { get; set; }

    public virtual DbSet<IssueBookTable> IssueBookTables { get; set; }

    public virtual DbSet<PublisherTable> PublisherTables { get; set; }

    public virtual DbSet<UserTable> UserTables { get; set; }

    public virtual DbSet<UserTypeTable> UserTypeTables { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=MSI\\SQLEXPRESS;Initial Catalog=LBMSDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AuthorTable>(entity =>
        {
            entity.HasKey(e => e.AuthorId);

            entity.ToTable("AuthorTable");

            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.AuthorName).HasMaxLength(200);
            entity.Property(e => e.DateOfBirth).HasColumnType("date");
            entity.Property(e => e.DateOfDeath).HasColumnType("date");
        });

        modelBuilder.Entity<BookFineTable>(entity =>
        {
            entity.HasKey(e => e.BookFineId);

            entity.ToTable("BookFineTable");

            entity.Property(e => e.BookFineId).HasColumnName("BookFineID");
            entity.Property(e => e.BookId).HasColumnName("BookID");
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.FineDate).HasColumnType("date");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Book).WithMany(p => p.BookFineTables)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookFineTable_BookTable");

            entity.HasOne(d => d.Employee).WithMany(p => p.BookFineTables)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookFineTable_EmployeeTable");

            entity.HasOne(d => d.User).WithMany(p => p.BookFineTables)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookFineTable_UserTable");
        });

        modelBuilder.Entity<BookReturnTable>(entity =>
        {
            entity.HasKey(e => e.BookReturnId);

            entity.ToTable("BookReturnTable");

            entity.Property(e => e.BookReturnId).HasColumnName("BookReturnID");
            entity.Property(e => e.BookId).HasColumnName("BookID");
            entity.Property(e => e.CurrentDate).HasColumnType("date");
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.ReturnDate).HasColumnType("date");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Book).WithMany(p => p.BookReturnTables)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookReturnTable_BookTable");

            entity.HasOne(d => d.Employee).WithMany(p => p.BookReturnTables)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookReturnTable_EmployeeTable");

            entity.HasOne(d => d.User).WithMany(p => p.BookReturnTables)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookReturnTable_UserTable");
        });

        modelBuilder.Entity<BookTable>(entity =>
        {
            entity.HasKey(e => e.BookId);

            entity.ToTable("BookTable");

            entity.Property(e => e.BookId).HasColumnName("BookID");
            entity.Property(e => e.Author).HasMaxLength(150);
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.BookName).HasMaxLength(200);
            entity.Property(e => e.BookTitle).HasMaxLength(200);
            entity.Property(e => e.BookTypeId).HasColumnName("BookTypeID");
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.PublisherId).HasColumnName("PublisherID");
            entity.Property(e => e.RegDate).HasColumnType("date");
            entity.Property(e => e.ShortDescription).HasMaxLength(500);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.AuthorNavigation).WithMany(p => p.BookTables)
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookTable_AuthorTable");

            entity.HasOne(d => d.BookType).WithMany(p => p.BookTables)
                .HasForeignKey(d => d.BookTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookTable_BookTypeTable");

            entity.HasOne(d => d.User).WithMany(p => p.BookTables)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookTable_UserTable");
        });

        modelBuilder.Entity<BookTypeTable>(entity =>
        {
            entity.HasKey(e => e.BookTypeId);

            entity.ToTable("BookTypeTable");

            entity.Property(e => e.BookTypeId).HasColumnName("BookTypeID");
            entity.Property(e => e.Name).HasMaxLength(200);
        });

        modelBuilder.Entity<CartTable>(entity =>
        {
            entity.HasKey(e => e.CartId);

            entity.ToTable("CartTable");

            entity.Property(e => e.CartId).HasColumnName("CartID");
            entity.Property(e => e.BookId).HasColumnName("BookID");
            entity.Property(e => e.BookName).HasMaxLength(250);

            entity.HasOne(d => d.Book).WithMany(p => p.CartTables)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CartTable_BookTable");
        });

        modelBuilder.Entity<EmployeeTable>(entity =>
        {
            entity.HasKey(e => e.EmployeeId);

            entity.ToTable("EmployeeTable");

            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.Address).HasMaxLength(300);
            entity.Property(e => e.ContactNo).HasMaxLength(50);
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.FullName).HasMaxLength(200);
            entity.Property(e => e.UserId).HasColumnName("UserID");
        });

        modelBuilder.Entity<IssueBookTable>(entity =>
        {
            entity.HasKey(e => e.IssueBookId);

            entity.ToTable("IssueBookTable");

            entity.Property(e => e.IssueBookId).HasColumnName("IssueBookID");
            entity.Property(e => e.BookId).HasColumnName("BookID");
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.IssueDate).HasColumnType("date");
            entity.Property(e => e.ReturnDate).HasColumnType("date");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Book).WithMany(p => p.IssueBookTables)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_IssueBookTable_BookTable");

            entity.HasOne(d => d.Employee).WithMany(p => p.IssueBookTables)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_IssueBookTable_EmployeeTable");

            entity.HasOne(d => d.User).WithMany(p => p.IssueBookTables)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_IssueBookTable_UserTable");
        });

        modelBuilder.Entity<PublisherTable>(entity =>
        {
            entity.HasKey(e => e.PublisherId);

            entity.ToTable("PublisherTable");

            entity.Property(e => e.PublisherId).HasColumnName("PublisherID");
            entity.Property(e => e.ContactNo).HasMaxLength(50);
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.PublisherName).HasMaxLength(50);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.PublisherTables)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PublisherTable_UserTable");
        });

        modelBuilder.Entity<UserTable>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("UserTable");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.EmployeeId).HasColumnName("EmployeeID");
            entity.Property(e => e.IsActive)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.UserName).HasMaxLength(50);
            entity.Property(e => e.UserTypeId).HasColumnName("UserTypeID");

            entity.HasOne(d => d.Employee).WithMany(p => p.UserTables)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("FK_UserTable_EmployeeTable");

            entity.HasOne(d => d.UserType).WithMany(p => p.UserTables)
                .HasForeignKey(d => d.UserTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserTable_UserTypeTable");
        });

        modelBuilder.Entity<UserTypeTable>(entity =>
        {
            entity.HasKey(e => e.UserTypeId);

            entity.ToTable("UserTypeTable");

            entity.Property(e => e.UserTypeId).HasColumnName("UserTypeID");
            entity.Property(e => e.UserType).HasMaxLength(200);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
