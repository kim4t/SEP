#pragma checksum "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "a0787d447297c1e60e22d6b76c222a08aa6e21b3"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\_ViewImports.cshtml"
using MovieShopMVC;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\_ViewImports.cshtml"
using MovieShopMVC.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a0787d447297c1e60e22d6b76c222a08aa6e21b3", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f0d2154f16347fb0df8a919e414827cd460665e4", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List< ApplicationCore.Models.MovieCardResponseModel>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n");
#nullable restore
#line 3 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Home Page";

#line default
#line hidden
#nullable disable
            WriteLiteral("\n\n<h2> Top Movies Count: ");
#nullable restore
#line 8 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
                  Write(Model.Count);

#line default
#line hidden
#nullable disable
            WriteLiteral("  </h2>\n\n");
#nullable restore
#line 10 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
 foreach (var movie in Model )
{

#line default
#line hidden
#nullable disable
            WriteLiteral("    <div>\n        ");
#nullable restore
#line 13 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
   Write(movie.Id);

#line default
#line hidden
#nullable disable
            WriteLiteral("<br />\n        ");
#nullable restore
#line 14 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
   Write(movie.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral(" <br />\n    </div>\n");
#nullable restore
#line 16 "C:\Users\김태호\Desktop\AntraAssignments\2021June-main\MovieShopMVC\Views\Home\Index.cshtml"
}

#line default
#line hidden
#nullable disable
            WriteLiteral("\n\n\n\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List< ApplicationCore.Models.MovieCardResponseModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591
