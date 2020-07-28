using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace eShopSolution.Data.Migrations
{
    public partial class ChangeFileLenghtType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<long>(
                name: "FileSize",
                table: "ProductImages",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.UpdateData(
                table: "AppRoles",
                keyColumn: "Id",
                keyValue: new Guid("3792af46-9a8f-4ae6-a1c9-c9c910941e5b"),
                column: "ConcurrencyStamp",
                value: "68a5a7ae-66e0-4b23-a842-509267ef990d");

            migrationBuilder.UpdateData(
                table: "AppUsers",
                keyColumn: "Id",
                keyValue: new Guid("be525247-1560-4657-8748-3563e08d7ed3"),
                columns: new[] { "ConcurrencyStamp", "PasswordHash" },
                values: new object[] { "59273abe-b60e-4e96-9bb6-3d140bdc0c23", "AQAAAAEAACcQAAAAEPKWGKzDjC3ncC9TjmN8UW3pc8FRmF+8srUERKUaw7MCar4bdply1ZJ+qfCu2kOj2Q==" });

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
                value: new DateTime(2020, 7, 27, 15, 45, 15, 564, DateTimeKind.Local).AddTicks(5862));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "FileSize",
                table: "ProductImages",
                type: "int",
                nullable: false,
                oldClrType: typeof(long));

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
        }
    }
}
