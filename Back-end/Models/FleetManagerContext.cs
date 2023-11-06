﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Back_end.Models;

public partial class FleetManagerContext : DbContext
{
    public FleetManagerContext()
    {
    }

    public FleetManagerContext(DbContextOptions<FleetManagerContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Bestuurder> Bestuurders { get; set; }

    public virtual DbSet<Manager> Managers { get; set; }

    public virtual DbSet<Tankkaart> Tankkaarts { get; set; }

    public virtual DbSet<Voertuig> Voertuigs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Bestuurder>(entity =>
        {
            entity.HasKey(e => e.IdBestuurder);

            entity.ToTable("Bestuurder", tb =>
                {
                    tb.HasTrigger("trg_CheckGeboorteDatum");
                    tb.HasTrigger("trg_CheckPostcode");
                });

            entity.Property(e => e.IdBestuurder).HasColumnName("Id_Bestuurder");
            entity.Property(e => e.CategorieRijbewijs)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Categorie_rijbewijs");
            entity.Property(e => e.Geboortedatum).HasColumnType("date");
            entity.Property(e => e.Huisnummer)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Login)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("login");
            entity.Property(e => e.Naam)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Paswoord)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Postcode)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Rijksregisternummer)
                .HasMaxLength(12)
                .IsUnicode(false);
            entity.Property(e => e.Stad)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Straat)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Voornaam)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Manager>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Manager__3214EC07F5CF0517");

            entity.ToTable("Manager", tb =>
                {
                    tb.HasTrigger("controle_tankkaart_invoer");
                    tb.HasTrigger("controle_voertuig_invoer");
                    tb.HasTrigger("trg_PreventDeleteManager");
                });

            entity.Property(e => e.IdBestuurder).HasColumnName("Id_Bestuurder");
            entity.Property(e => e.IdTankkaart).HasColumnName("Id_Tankkaart");
            entity.Property(e => e.IdVoertuig).HasColumnName("Id_Voertuig");
        });

        modelBuilder.Entity<Tankkaart>(entity =>
        {
            entity.HasKey(e => e.IdTankkaart);

            entity.ToTable("Tankkaart", tb =>
                {
                    tb.HasTrigger("trg_CheckGeldigheidsdatum");
                    tb.HasTrigger("trg_UniekeKaartnummer");
                });

            entity.Property(e => e.IdTankkaart).HasColumnName("Id_Tankkaart");
            entity.Property(e => e.Brandstoffen)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Geldigheidsdatum).HasColumnType("date");
            entity.Property(e => e.Kaartnummer)
                .HasMaxLength(12)
                .IsUnicode(false);
            entity.Property(e => e.Pincode)
                .HasMaxLength(6)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Voertuig>(entity =>
        {
            entity.HasKey(e => e.IdVoertuig);

            entity.ToTable("Voertuig", tb =>
                {
                    tb.HasTrigger("trg_ControleDeuren");
                    tb.HasTrigger("trg_UniekeChassisnummer");
                    tb.HasTrigger("trg_UniekeNummerplaat");
                });

            entity.Property(e => e.IdVoertuig).HasColumnName("Id_Voertuig");
            entity.Property(e => e.AantalDeuren).HasColumnName("Aantal_deuren");
            entity.Property(e => e.Brandstoftype)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.Chassisnummer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Kleur)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.Merk)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Model)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Nummerplaat)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.TypeVoertuig)
                .HasMaxLength(25)
                .IsUnicode(false)
                .HasColumnName("Type_voertuig");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
