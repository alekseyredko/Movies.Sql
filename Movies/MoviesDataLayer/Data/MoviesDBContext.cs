﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using MoviesDataLayer.Models;

#nullable disable

namespace MoviesDataLayer.Data
{
    public partial class MoviesDBContext : DbContext
    {
        public MoviesDBContext()
        {
        }

        public MoviesDBContext(DbContextOptions<MoviesDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Actor> Actors { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<MovieGenre> MovieGenres { get; set; }
        public virtual DbSet<MoviesActor> MoviesActors { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<ProducerMovie> ProducerMovies { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Reviewer> Reviewers { get; set; }
        public virtual DbSet<ReviewerWatchHistory> ReviewerWatchHistories { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=MSQL-03467;Initial Catalog=MoviesDB;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Cyrillic_General_CI_AS");

            modelBuilder.Entity<Actor>(entity =>
            {
                entity.ToTable("Actor");

                entity.Property(e => e.ActorId).ValueGeneratedNever();

                entity.HasOne(d => d.ActorNavigation)
                    .WithOne(p => p.Actor)
                    .HasForeignKey<Actor>(d => d.ActorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Actor__ActorId__2D27B809");
            });

            modelBuilder.Entity<Genre>(entity =>
            {
                entity.ToTable("Genre");

                entity.HasIndex(e => e.GenreName, "UQ__Genre__BBE1C339429BC4B1")
                    .IsUnique();

                entity.Property(e => e.GenreName)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Movie>(entity =>
            {
                entity.ToTable("Movie");

                entity.Property(e => e.LastUpdate).HasColumnType("datetime");

                entity.Property(e => e.MovieName)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MovieGenre>(entity =>
            {
                entity.HasKey(e => new { e.GenreId, e.MovieId })
                    .HasName("PK__MovieGen__B7382C3F24545B4F");

                entity.HasOne(d => d.Genre)
                    .WithMany(p => p.MovieGenres)
                    .HasForeignKey(d => d.GenreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__MovieGenr__Genre__3E52440B");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.MovieGenres)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__MovieGenr__Movie__3F466844");
            });

            modelBuilder.Entity<MoviesActor>(entity =>
            {
                entity.HasKey(e => new { e.ActorId, e.MovieId })
                    .HasName("PK__MoviesAc__E30EC30A44E7D562");

                entity.HasOne(d => d.Actor)
                    .WithMany(p => p.MoviesActors)
                    .HasForeignKey(d => d.ActorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__MoviesAct__Actor__4222D4EF");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.MoviesActors)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__MoviesAct__Movie__4316F928");
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.ToTable("Person");

                entity.HasIndex(e => e.PersonName, "UQ__Person__B88311BE6306F845")
                    .IsUnique();

                entity.Property(e => e.PersonName)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProducerMovie>(entity =>
            {
                entity.HasKey(e => new { e.ProducerId, e.MovieId })
                    .HasName("PK__Producer__A78BBF1302A41092");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.ProducerMovies)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProducerM__Movie__31EC6D26");

                entity.HasOne(d => d.Producer)
                    .WithMany(p => p.ProducerMovies)
                    .HasForeignKey(d => d.ProducerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProducerM__Produ__30F848ED");
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.ToTable("Review");

                entity.Property(e => e.LastUpdate).HasColumnType("datetime");

                entity.Property(e => e.Rate).HasDefaultValueSql("((5))");

                entity.Property(e => e.RevievText)
                    .IsRequired()
                    .HasMaxLength(1024)
                    .IsUnicode(false);

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Review__MovieId__3A81B327");

                entity.HasOne(d => d.Reviewer)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.ReviewerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Review__Reviewer__3B75D760");
            });

            modelBuilder.Entity<Reviewer>(entity =>
            {
                entity.ToTable("Reviewer");

                entity.Property(e => e.ReviewerId).ValueGeneratedNever();

                entity.HasOne(d => d.ReviewerNavigation)
                    .WithOne(p => p.Reviewer)
                    .HasForeignKey<Reviewer>(d => d.ReviewerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reviewer__Review__34C8D9D1");
            });

            modelBuilder.Entity<ReviewerWatchHistory>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ReviewerWatchHistory");

                entity.Property(e => e.LastWatchTime).HasColumnType("datetime");

                entity.Property(e => e.ReviewerId).HasColumnName("ReviewerID");

                entity.HasOne(d => d.Movie)
                    .WithMany()
                    .HasForeignKey(d => d.MovieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ReviewerW__Movie__44FF419A");

                entity.HasOne(d => d.Reviewer)
                    .WithMany()
                    .HasForeignKey(d => d.ReviewerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ReviewerW__Revie__45F365D3");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
