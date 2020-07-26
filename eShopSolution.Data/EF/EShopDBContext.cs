using eShopSolution.Data.Configurations;
using eShopSolution.Data.Entities;
using eShopSolution.Data.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.Data.EF
{
    // trang hướng dẫn kết nối
    //https://docs.microsoft.com/en-us/ef/core/miscellaneous/connection-strings
    public class EShopDBContext : DbContext // kế thừa của thằng Microsoft.EntityFrameworkCore;
    {
        public EShopDBContext(DbContextOptions options) : base(options) // khi kế thừa nó có thể Generate ra thằng này
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // configuration useing fluent API  ( cấu hính sử dụng API)
            modelBuilder.ApplyConfiguration(new CartConfiguration());

            modelBuilder.ApplyConfiguration(new AppConfigConfiguration());//https://www.learnentityframeworkcore.com/configuration/fluent-api
            modelBuilder.ApplyConfiguration(new ProductConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new ProductInCategoryConfiguration());
            modelBuilder.ApplyConfiguration(new OrderConfiguration());

            modelBuilder.ApplyConfiguration(new OrderDetailConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryTranslationConfiguration());
            modelBuilder.ApplyConfiguration(new ContactConfiguration());
            modelBuilder.ApplyConfiguration(new LanguageConfiguration());
            modelBuilder.ApplyConfiguration(new ProductTranslationConfiguration());
            modelBuilder.ApplyConfiguration(new PromotionConfiguration());
            modelBuilder.ApplyConfiguration(new TransactionConfiguration());


            // cách seeding dữ liệu trực tiếp (lưu ý rất dài lên dùng cách tách ra file ở cách 2)
            //cách 1:
            // Data seeding ( them dữ liệu cho từng thực thể)  như kiểu tạo record trong database
            //modelBuilder.Entity<AppConfig>().HasData(
            //    new AppConfig() { Key = "HomeTitle",Value="this is a home page eShopeSlution" },
            //     new AppConfig() { Key = "HomeKeyWord", Value = "this is KeyWord of eShopeSlution" },
            //      new AppConfig() { Key = "HomeDescription", Value = "this is Description of eShopeSlution" }
            //       );

            // cách 2:
            modelBuilder.Seed();   // tạo extension Seed bên ModelBuilderExtension




            // giúp làm một số việc khi tạo dbcontext
            // base.OnModelCreating(modelBuilder);
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }

        public DbSet<AppConfig> AppConfigs { get; set; }


        public DbSet<Cart> Carts { get; set; }

        public DbSet<CategoryTranslation> CategoryTranslations { get; set; }
        public DbSet<ProductInCategory> ProductInCategories { get; set; }

        public DbSet<Contact> Contacts { get; set; }

        public DbSet<Language> Languages { get; set; }

        public DbSet<Order> Orders { get; set; }

        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<ProductTranslation> ProductTranslations { get; set; }

        public DbSet<Promotion> Promotions { get; set; }


        public DbSet<TranSaction> Transactions { get; set; }

    }
}
