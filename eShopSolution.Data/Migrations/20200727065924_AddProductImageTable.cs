using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace eShopSolution.Data.Migrations
{
    public partial class AddProductImageTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "OrderDate",
                table: "Orders",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2020, 7, 26, 20, 20, 46, 207, DateTimeKind.Local).AddTicks(4833));

            migrationBuilder.CreateTable(
                name: "ProductImages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductId = table.Column<int>(nullable: false),
                    ImagePath = table.Column<string>(maxLength: 200, nullable: false),
                    Caption = table.Column<string>(maxLength: 200, nullable: true),
                    Isdefault = table.Column<bool>(nullable: false),
                    DateCreated = table.Column<DateTime>(nullable: false),
                    SortOrder = table.Column<int>(nullable: false),
                    FileSize = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductImages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProductImages_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "AppRoles",
                keyColumn: "Id",
                keyValue: new Guid("3792af46-9a8f-4ae6-a1c9-c9c910941e5b"),
                column: "ConcurrencyStamp",
                value: "cf8bb40c-49c4-405e-b24c-9f70c4a5946d");

            migrationBuilder.UpdateData(
                table: "AppUsers",
                keyColumn: "Id",
                keyValue: new Guid("be525247-1560-4657-8748-3563e08d7ed3"),
                columns: new[] { "ConcurrencyStamp", "PasswordHash" },
                values: new object[] { "96361bba-dc66-4ab4-8b58-b7b45a3bc80b", "AQAAAAEAACcQAAAAEFDdQOp1XoCbolOjs+7Ku1j+d/V1nzSslGrE3DfGvT8iOpXt/7sCsYKDHnbdOYFI9w==" });

            migrationBuilder.UpdateData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 1,
                column: "Status",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 2,
                column: "Status",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 1,
                column: "DateCreated",
                value: new DateTime(2020, 7, 27, 13, 59, 23, 537, DateTimeKind.Local).AddTicks(4500));

            migrationBuilder.CreateIndex(
                name: "IX_ProductImages_ProductId",
                table: "ProductImages",
                column: "ProductId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductImages");

            migrationBuilder.AlterColumn<DateTime>(
                name: "OrderDate",
                table: "Orders",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2020, 7, 26, 20, 20, 46, 207, DateTimeKind.Local).AddTicks(4833),
                oldClrType: typeof(DateTime));

            migrationBuilder.UpdateData(
                table: "AppRoles",
                keyColumn: "Id",
                keyValue: new Guid("3792af46-9a8f-4ae6-a1c9-c9c910941e5b"),
                column: "ConcurrencyStamp",
                value: "ccf2ea50-7cc7-4f49-8cd8-08fba20911fa");

            migrationBuilder.UpdateData(
                table: "AppUsers",
                keyColumn: "Id",
                keyValue: new Guid("be525247-1560-4657-8748-3563e08d7ed3"),
                columns: new[] { "ConcurrencyStamp", "PasswordHash" },
                values: new object[] { "bd0b6108-36fd-4ea3-a75b-b115370afbb4", "AQAAAAEAACcQAAAAENkIF+sMAhCspadokINgv+km4xwOy/1Y2yTSR9pm7/s10Fwnt7gklCNbbA73hjL7PA==" });

            migrationBuilder.UpdateData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 1,
                column: "Status",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Categories",
                keyColumn: "Id",
                keyValue: 2,
                column: "Status",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 1,
                column: "DateCreated",
                value: new DateTime(2020, 7, 26, 20, 20, 46, 223, DateTimeKind.Local).AddTicks(4136));
        }
    }
}
