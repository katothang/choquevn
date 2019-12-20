using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CuaHangDoGo.Startup))]
namespace CuaHangDoGo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {

        }
    }
}
