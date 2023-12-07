﻿// <auto-generated />
using System;
using FleetManager.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Back_end.Migrations
{
    [DbContext(typeof(FleetManagerContext))]
    partial class FleetManagerContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("FleetManager.Models.Authentication", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Authentication", (string)null);
                });

            modelBuilder.Entity("FleetManager.Models.Connection", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("Id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("IdDriver")
                        .HasColumnType("int")
                        .HasColumnName("IdDriver");

                    b.Property<int>("IdGasCard")
                        .HasColumnType("int")
                        .HasColumnName("IdGasCard");

                    b.Property<int>("IdVehicle")
                        .HasColumnType("int")
                        .HasColumnName("IdVehicle");

                    b.HasKey("Id");

                    b.HasIndex("IdGasCard");

                    b.HasIndex("IdVehicle");

                    b.HasIndex("IdDriver", "IdGasCard", "IdVehicle")
                        .IsUnique();

                    b.ToTable("Connection", (string)null);
                });

            modelBuilder.Entity("FleetManager.Models.Driver", b =>
                {
                    b.Property<int>("IdDriver")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("IdDriver");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdDriver"));

                    b.Property<string>("CategoryLicense")
                        .HasMaxLength(10)
                        .IsUnicode(false)
                        .HasColumnType("varchar(10)");

                    b.Property<string>("City")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime?>("DayOfBirth")
                        .HasColumnType("date");

                    b.Property<string>("FirstName")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Inserts")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Name")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Number")
                        .HasMaxLength(10)
                        .IsUnicode(false)
                        .HasColumnType("varchar(10)");

                    b.Property<string>("RegistryNumber")
                        .HasMaxLength(12)
                        .IsUnicode(false)
                        .HasColumnType("varchar(12)");

                    b.Property<string>("Street")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<int?>("ZipCode")
                        .IsUnicode(false)
                        .HasColumnType("int");

                    b.HasKey("IdDriver");

                    b.ToTable("Driver", null, t =>
                        {
                            t.HasTrigger("TG_Check_Age_Driver");

                            t.HasTrigger("TG_Check_Driver");

                            t.HasTrigger("TG_Check_ZipCode");
                        });

                    b.HasAnnotation("SqlServer:UseSqlOutputClause", false);
                });

            modelBuilder.Entity("FleetManager.Models.GasCard", b =>
                {
                    b.Property<int>("IdGasCard")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("IdGasCard");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdGasCard"));

                    b.Property<string>("Blocked")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasColumnType("nvarchar(max)")
                        .HasDefaultValueSql("False");

                    b.Property<string>("CardNumber")
                        .IsRequired()
                        .HasMaxLength(12)
                        .IsUnicode(false)
                        .HasColumnType("varchar(12)");

                    b.Property<string>("Fuel")
                        .IsRequired()
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)");

                    b.Property<string>("Pin")
                        .HasMaxLength(6)
                        .IsUnicode(false)
                        .HasColumnType("varchar(6)");

                    b.Property<DateTime>("ValidationDate")
                        .HasColumnType("date");

                    b.HasKey("IdGasCard");

                    b.ToTable("GasCard", null, t =>
                        {
                            t.HasTrigger("TG_Check_GasCard");

                            t.HasTrigger("TG_Check_ValidationDate");
                        });

                    b.HasAnnotation("SqlServer:UseSqlOutputClause", false);
                });

            modelBuilder.Entity("FleetManager.Models.Vehicle", b =>
                {
                    b.Property<int>("IdVehicle")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("IdVehicle");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdVehicle"));

                    b.Property<string>("Brand")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("ChassisNumber")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Color")
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)");

                    b.Property<string>("Fuel")
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)");

                    b.Property<string>("LicensePlate")
                        .HasMaxLength(10)
                        .IsUnicode(false)
                        .HasColumnType("varchar(10)");

                    b.Property<string>("Model")
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)");

                    b.Property<int?>("NumberOfDoors")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasDefaultValue(0);

                    b.Property<string>("VehicleType")
                        .HasMaxLength(25)
                        .IsUnicode(false)
                        .HasColumnType("varchar(25)");

                    b.HasKey("IdVehicle");

                    b.ToTable("Vehicle", null, t =>
                        {
                            t.HasTrigger("TG_Check_ChassisNumber");

                            t.HasTrigger("TG_Check_NumberOfDoors");
                        });

                    b.HasAnnotation("SqlServer:UseSqlOutputClause", false);
                });

            modelBuilder.Entity("FleetManager.Models.Connection", b =>
                {
                    b.HasOne("FleetManager.Models.Driver", "IdDriverNavigation")
                        .WithMany()
                        .HasForeignKey("IdDriver")
                        .IsRequired()
                        .HasConstraintName("FK__Connectie__IdBes__1A9EF37A");

                    b.HasOne("FleetManager.Models.GasCard", "IdGasCardNavigation")
                        .WithMany()
                        .HasForeignKey("IdGasCard")
                        .IsRequired()
                        .HasConstraintName("FK__Connectie__IdTan__1B9317B3");

                    b.HasOne("FleetManager.Models.Vehicle", "IdVehicleNavigation")
                        .WithMany()
                        .HasForeignKey("IdVehicle")
                        .IsRequired()
                        .HasConstraintName("FK__Connectie__IdVoe__1C873BEC");

                    b.Navigation("IdDriverNavigation");

                    b.Navigation("IdGasCardNavigation");

                    b.Navigation("IdVehicleNavigation");
                });
#pragma warning restore 612, 618
        }
    }
}
