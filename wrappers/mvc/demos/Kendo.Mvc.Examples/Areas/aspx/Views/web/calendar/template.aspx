<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<%
    var dates = new List<long>()
    {
        new DateTime(DateTime.Today.Year, DateTime.Today.Month, 8).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month, 12).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month, 24).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month + 1, 6).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month + 1, 7).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month + 1, 25).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month + 1, 27).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month - 1, 3).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month - 1, 5).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month - 2, 22).Ticks,
        new DateTime(DateTime.Today.Year, DateTime.Today.Month - 2, 27).Ticks
    };
%>

<div id="special-days">
  <%= Html.Kendo().Calendar()
          .Name("calendar")
          .Value(DateTime.Today)
          .HtmlAttributes(new { style = "width:300px" })
          .Footer("Today - #=kendo.toString(data, 'd') #")
          .MonthTemplate("# if ($.inArray(+data.date, " + new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(dates) + ") != -1) { #" +
                             "'<div class=\"" +
                             "# if (data.value < 10) { #" +
                                        "exhibition" +
                                    "# } else if ( data.value < 20 ) { #" +
                                        "party" +
                                    "# } else { #" +
                                        "cocktail" +
                                    "# } #" +
                                "\"></div>" +
                         "# } #" +
                         "#= data.value #")                     
  %>
</div>

<style scoped>
    #special-days {
        height: 270px;
        width: 500px;
        margin: 30px auto;
        padding: 22px 0 0 21px;
        background: url('<%= Url.Content("~/Content/web/calendar/specialDays.png") %>') transparent no-repeat 0 0;
    }

    #calendar {
        border-radius: 3px 3px 3px 3px;
        border-style: solid;
        border-width: 1px;
    }

    .k-header {
        border-radius: 3px 3px 0 0;
    }

    #calendar .k-content {
        height: 168px;
    }

    .exhibition {
        background: transparent url(<%= Url.Content("~/Content/web/calendar/exhibition.png")%>) no-repeat 0 50%;
        display: inline-block;
        width: 16px;
        height: 16px;
        vertical-align: middle;
        margin-right: 3px;
    }

    .party {
        background: transparent url(<%= Url.Content("~/Content/web/calendar/party.png")%>) no-repeat 0 50%;
        display: inline-block;
        width: 16px;
        height: 16px;
        vertical-align: middle;
        margin-right: 3px;
    }

    .cocktail {
        background: transparent url(<%= Url.Content("~/Content/web/calendar/cocktail.png")%>) no-repeat 0 50%;
        display: inline-block;
        width: 16px;
        height: 16px;
        vertical-align: middle;
        margin-right: 3px;
    }

</style>
</asp:Content>