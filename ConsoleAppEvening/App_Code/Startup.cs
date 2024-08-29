using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConsoleAppEvening.Startup))]
namespace ConsoleAppEvening
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
