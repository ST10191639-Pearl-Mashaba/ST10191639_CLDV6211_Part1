using EEApp.Data;
using Microsoft.EntityFrameworkCore;

namespace EEApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            // Source: Stack Overflow - "Config connection string in .NET Core 6"
            // https://stackoverflow.com/questions/68980778/config-connection-string-in-net-core-6
            // Answer by user: George Piano Manikas (https://stackoverflow.com/users/10210281/george-piano-manikas)
            builder.Services.AddDbContext<EEDBContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("LiveConn")));

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseRouting();

            app.UseAuthorization();

            app.MapStaticAssets();
            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}")
                .WithStaticAssets();

            app.Run();
        }
    }
}
