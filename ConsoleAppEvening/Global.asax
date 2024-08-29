<%@ Application Language="C#" %>
<%@ Import Namespace="ConsoleAppEvening" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }
    void Session_start(object sender, EventArgs e)
    {
        Session.Add("userid", "");
        Session.Add("LoginName", "");
        Session.Add("UserRights",null);

    }
    void session_End(object sender, EventArgs e)
    {
        Session.Clear();
    }

</script>
