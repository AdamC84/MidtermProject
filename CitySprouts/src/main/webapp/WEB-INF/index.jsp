<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>City Sprouts - Connecting Urban Growers</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="vendor/bootstrap-select/css/bootstrap-select.min.css">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="vendor/nouislider/nouislider.css">
    <!-- Custom font icons-->
    <link rel="stylesheet" href="css/custom-fonticons.css">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700">
    <!-- owl carousel-->
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Modernizr-->
    <script src="js/modernizr.custom.79639.js"></script>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<title>Home</title>
<style type="text/css">
<%@include file="css/custom.css" %>
<%@include file="css/custom-fonticons.css" %>

<%@include file="scss/style.pink.scss" %>
<%@include file="scss/style.default.scss" %>
<%@include file="scss/core.scss" %>
<%@include file="scss/style.green.scss" %>
<%@include file="scss/style.blue.scss" %>
<%@include file="scss/style.sea.scss" %>
<%@include file="scss/modules/_cart.scss" %>
<%@include file="scss/modules/_functions.scss" %>
<%@include file="scss/modules/_demo.scss" %>
<%@include file="scss/modules/_variables.scss" %>
<%@include file="scss/modules/_about.scss" %>
<%@include file="scss/modules/_product-categories.scss" %>
<%@include file="scss/modules/mixins/_reset-text.scss" %>
<%@include file="scss/modules/mixins/_hover.scss" %>
<%@include file="scss/modules/mixins/_image.scss" %>
<%@include file="scss/modules/mixins/_badge.scss" %>
<%@include file="scss/modules/mixins/_lists.scss" %>
<%@include file="scss/modules/mixins/_float.scss" %>
<%@include file="scss/modules/mixins/_gradients.scss" %>
<%@include file="scss/modules/mixins/_text-truncate.scss" %>
<%@include file="scss/modules/mixins/_navbar-align.scss" %>


<%@include file="scss/modules/mixins/_background-variant.scss" %>
<%@include file="scss/modules/mixins/_breakpoints.scss" %>
<%@include file="scss/modules/mixins/_box-shadow.scss" %>
<%@include file="scss/modules/mixins/_forms.scss" %>
<%@include file="scss/modules/mixins/_buttons.scss" %>
<%@include file="scss/modules/mixins/_transition.scss" %>
<%@include file="scss/modules/mixins/_grid-framework.scss" %>
<%@include file="scss/modules/mixins/_caret.scss" %>
<%@include file="scss/modules/mixins/_resize.scss" %>
<%@include file="scss/modules/mixins/_screen-reader.scss" %>
<%@include file="scss/modules/mixins/_nav-divider.scss" %>
<%@include file="scss/modules/mixins/_list-group.scss" %>
<%@include file="scss/modules/mixins/_pagination.scss" %>
<%@include file="scss/modules/mixins/_clearfix.scss" %>
<%@include file="scss/modules/mixins/_grid.scss" %>
<%@include file="scss/modules/mixins/_text-hide.scss" %>
<%@include file="scss/modules/mixins/_alert.scss" %>
<%@include file="scss/modules/mixins/_border-radius.scss" %>
<%@include file="scss/modules/mixins/_size.scss" %>
<%@include file="scss/modules/mixins/_visibility.scss" %>
<%@include file="scss/modules/_variables-custom.scss" %>
<%@include file="scss/modules/_product-details.scss" %>
<%@include file="scss/modules/_contact.scss" %>
<%@include file="scss/modules/_mixins-custom.scss" %>
<%@include file="scss/modules/_customer.scss" %>
<%@include file="scss/modules/_utilities.scss" %>
<%@include file="scss/modules/_general.scss" %>
<%@include file="scss/modules/utilities/_background.scss" %>
<%@include file="scss/modules/utilities/_float.scss" %>
<%@include file="scss/modules/utilities/_borders.scss" %>
<%@include file="scss/modules/utilities/_flex.scss" %>
<%@include file="scss/modules/utilities/_clearfix.scss" %>
<%@include file="scss/modules/utilities/_align.scss" %>
<%@include file="scss/modules/utilities/_screenreaders.scss" %>
<%@include file="scss/modules/utilities/_embed.scss" %>
<%@include file="scss/modules/utilities/_sizing.scss" %>
<%@include file="scss/modules/utilities/_position.scss" %>
<%@include file="scss/modules/utilities/_visibility.scss" %>
<%@include file="scss/modules/utilities/_text.scss" %>
<%@include file="scss/modules/utilities/_spacing.scss" %>
<%@include file="scss/modules/utilities/_display.scss" %>
<%@include file="scss/modules/_mixins.scss" %>
<%@include file="scss/modules/_blog.scss" %>
<%@include file="scss/modules/_checkout.scss" %>
<%@include file="scss/theme.scss" %>
<%@include file="scss/style.red.scss" %>
<%@include file="scss/style.violet.scss" %>

<%@include file="js/modernizr.custom.79639.js" %>
<%@include file="js/front.js" %>

<%@include file="icons-reference/icons-reference.html" %>
<%@include file="icons-reference/styles.css" %>
<%@include file="icons-reference/fonts/clotheshub.svg" %>
<%@include file="icons-reference/fonts/clotheshub.woff" %>
<%@include file="icons-reference/fonts/clotheshub.eot" %>
<%@include file="icons-reference/fonts/clotheshub.ttf" %>

<%@include file="docs/index.html" %>
<%@include file="docs/css/bootstrap.min.css" %>
<%@include file="docs/css/bootstrap.css" %>
<%@include file="docs/css/prettyPhoto.css" %>
<%@include file="docs/css/animate.css" %>
<%@include file="docs/css/stroke.css" %>
<%@include file="docs/css/custom.css" %>
<%@include file="docs/css/bootstrap.css.map" %>
<%@include file="docs/css/bootstrap-theme.css.map" %>
<%@include file="docs/css/style.css" %>
<%@include file="docs/css/bootstrap-theme.css" %>
<%@include file="docs/css/bootstrap-theme.min.css" %>
<%@include file="docs/images/favicon.ico" %>
<%@include file="docs/images/dummy.png" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/btnNext.png" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/btnPrevious.png" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/default_thumbnail.gif" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/loader.gif" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/sprite.png" %>
<%@include file="docs/images/prettyPhoto/dark_rounded/contentPattern.png" %>
<%@include file="docs/images/prettyPhoto/light_rounded/btnNext.png" %>
<%@include file="docs/images/prettyPhoto/light_rounded/btnPrevious.png" %>
<%@include file="docs/images/prettyPhoto/light_rounded/default_thumbnail.gif" %>
<%@include file="docs/images/prettyPhoto/light_rounded/loader.gif" %>
<%@include file="docs/images/prettyPhoto/light_rounded/sprite.png" %>
<%@include file="docs/images/prettyPhoto/default/sprite_prev.png" %>
<%@include file="docs/images/prettyPhoto/default/sprite_x.png" %>
<%@include file="docs/images/prettyPhoto/default/sprite_y.png" %>
<%@include file="docs/images/prettyPhoto/default/sprite_next.png" %>
<%@include file="docs/images/prettyPhoto/default/default_thumb.png" %>
<%@include file="docs/images/prettyPhoto/default/loader.gif" %>
<%@include file="docs/images/prettyPhoto/default/sprite.png" %>
<%@include file="docs/images/prettyPhoto/facebook/btnNext.png" %>
<%@include file="docs/images/prettyPhoto/facebook/contentPatternTop.png" %>
<%@include file="docs/images/prettyPhoto/facebook/contentPatternBottom.png" %>
<%@include file="docs/images/prettyPhoto/facebook/btnPrevious.png" %>
<%@include file="docs/images/prettyPhoto/facebook/default_thumbnail.gif" %>
<%@include file="docs/images/prettyPhoto/facebook/contentPatternRight.png" %>
<%@include file="docs/images/prettyPhoto/facebook/contentPatternLeft.png" %>
<%@include file="docs/images/prettyPhoto/facebook/loader.gif" %>
<%@include file="docs/images/prettyPhoto/facebook/sprite.png" %>
<%@include file="docs/images/prettyPhoto/light_square/btnNext.png" %>
<%@include file="docs/images/prettyPhoto/light_square/btnPrevious.png" %>
<%@include file="docs/images/prettyPhoto/light_square/default_thumbnail.gif" %>
<%@include file="docs/images/prettyPhoto/light_square/loader.gif" %>
<%@include file="docs/images/prettyPhoto/light_square/sprite.png" %>
<%@include file="docs/images/prettyPhoto/dark_square/btnNext.png" %>
<%@include file="docs/images/prettyPhoto/dark_square/btnPrevious.png" %>
<%@include file="docs/images/prettyPhoto/dark_square/default_thumbnail.gif" %>
<%@include file="docs/images/prettyPhoto/dark_square/loader.gif" %>
<%@include file="docs/images/prettyPhoto/dark_square/sprite.png" %>
<%@include file="docs/images/prettyPhoto/dark_square/contentPattern.png" %>
<%@include file="docs/js/wow.js" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeFadeToGrey.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreMDUltra.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreFadeToGrey.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreMidnight.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreEmacs.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeMidnight.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeRDark.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeMDUltra.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeEmacs.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCore.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreDefault.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreEclipse.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreRDark.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeEclipse.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeDjango.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shThemeDefault.css" %>
<%@include file="docs/js/syntax-highlighter/styles/shCoreDjango.css" %>
<%@include file="docs/js/syntax-highlighter/scripts/shAutoloader.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushErlang.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushJavaFX.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushJava.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushPlain.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushVb.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushPhp.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushSql.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushAppleScript.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushRuby.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushSass.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushScala.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushPerl.js" %>

<%@include file="docs/js/syntax-highlighter/scripts/shBrushDelphi.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushBash.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushCss.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushCpp.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushPowerShell.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushXml.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushPython.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushDiff.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushJScript.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushCSharp.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shLegacy.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushAS3.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushColdFusion.js" %>
<%@include file="docs/js/syntax-highlighter/scripts/shBrushGroovy.js" %>
<%@include file="docs/js/jquery.fitvids.js" %>
<%@include file="docs/js/bootstrap.js" %>
<%@include file="docs/js/custom.js" %>
<%@include file="docs/js/jquery.min.js" %>
<%@include file="docs/js/main.js" %>
<%@include file="docs/js/bootstrap.min.js" %>
<%@include file="docs/js/retina.js" %>
<%@include file="docs/js/jquery.prettyPhoto.js" %>
<%@include file="docs/js/jquery.min.map" %>
<%@include file="docs/fonts/glyphicons-halflings-regular.woff" %>
<%@include file="docs/fonts/glyphicons-halflings-regular.eot" %>
<%@include file="docs/fonts/lanenar_Lane.eot" %>

<%@include file="docs/fonts/Stroke-Gap-Icons.svg" %>
<%@include file="docs/fonts/lanenar_Lane.ttf" %>
<%@include file="docs/fonts/glyphicons-halflings-regular.ttf" %>
<%@include file="docs/fonts/Stroke-Gap-Icons.woff" %>
<%@include file="docs/fonts/Stroke-Gap-Icons.eot" %>
<%@include file="docs/fonts/Stroke-Gap-Icons.ttf" %>
<%@include file="docs/fonts/lanenar_Lane.svg" %>
<%@include file="docs/fonts/glyphicons-halflings-regular.svg" %>
<%@include file="docs/fonts/font-awesome-4.3.0/css/font-awesome.css" %>
<%@include file="docs/fonts/font-awesome-4.3.0/css/font-awesome.min.css" %>
<%@include file="docs/fonts/font-awesome-4.3.0/fonts/fontawesome-webfont.svg" %>


<%@include file="docs/fonts/font-awesome-4.3.0/fonts/fontawesome-webfont.ttf" %>
<%@include file="docs/fonts/font-awesome-4.3.0/fonts/fontawesome-webfont.woff" %>
<%@include file="docs/fonts/font-awesome-4.3.0/fonts/fontawesome-webfont.eot" %>

<%@include file="fonts/fontawesome-webfont.svg" %>

<%@include file="fonts/clotheshub.svg" %>
<%@include file="fonts/fontawesome-webfont.woff2" %>
<%@include file="fonts/clotheshub.woff" %>
<%@include file="fonts/clotheshub.eot" %>
<%@include file="fonts/fontawesome-webfont.ttf" %>
<%@include file="fonts/clotheshub.ttf" %>
<%@include file="fonts/fontawesome-webfont.woff" %>
<%@include file="fonts/fontawesome-webfont.eot" %>

<%@include file="vendor/.DS_Store" %>
<%@include file="vendor/bootstrap/.DS_Store" %>
<%@include file="vendor/bootstrap/css/bootstrap.min.css" %>
<%@include file="vendor/bootstrap/css/bootstrap.css" %>
<%@include file="vendor/bootstrap/css/bootstrap-grid.min.css" %>
<%@include file="vendor/bootstrap/css/bootstrap-reboot.min.css" %>
<%@include file="vendor/bootstrap/css/bootstrap-reboot.css" %>
<%@include file="vendor/bootstrap/css/bootstrap-grid.css" %>
<%@include file="vendor/bootstrap/js/bootstrap.bundle.js" %>
<%@include file="vendor/bootstrap/js/bootstrap.js" %>
<%@include file="vendor/bootstrap/js/bootstrap.bundle.min.js" %>
<%@include file="vendor/bootstrap/js/bootstrap.min.js" %>
<%@include file="vendor/jquery/jquery.slim.min.js" %>
<%@include file="vendor/jquery/jquery.slim.js" %>
<%@include file="vendor/jquery/core.js" %>
<%@include file="vendor/jquery/jquery.min.js" %>
<%@include file="vendor/jquery/jquery.js" %>
<%@include file="vendor/jquery-parallax.js/parallax.js" %>
<%@include file="vendor/jquery-parallax.js/parallax.min.js" %>
<%@include file="vendor/owl.carousel/owl.carousel.js" %>

<%@include file="vendor/owl.carousel/assets/ajax-loader.gif" %>
<%@include file="vendor/owl.carousel/assets/owl.theme.green.css" %>
<%@include file="vendor/owl.carousel/assets/owl.theme.green.min.css" %>
<%@include file="vendor/owl.carousel/assets/owl.video.play.png" %>
<%@include file="vendor/owl.carousel/assets/owl.theme.default.min.css" %>
<%@include file="vendor/owl.carousel/assets/owl.carousel.min.css" %>
<%@include file="vendor/owl.carousel/assets/owl.theme.default.css" %>
<%@include file="vendor/owl.carousel/assets/owl.carousel.css" %>
<%@include file="vendor/imagesloaded/sandbox/background/index.html" %>
<%@include file="vendor/imagesloaded/sandbox/background/css/background.css" %>
<%@include file="vendor/imagesloaded/sandbox/progress/index.html" %>
<%@include file="vendor/imagesloaded/sandbox/progress/progress.js" %>
<%@include file="vendor/imagesloaded/imagesloaded.js" %>
<%@include file="vendor/imagesloaded/imagesloaded.pkgd.min.js" %>
<%@include file="vendor/imagesloaded/imagesloaded.pkgd.js" %>
<%@include file="vendor/imagesloaded/assets/2D333F_0_0.woff" %>
<%@include file="vendor/imagesloaded/assets/2D333F_2_0.woff" %>

<%@include file="vendor/imagesloaded/assets/2D333F_1_0.woff2" %>

<%@include file="vendor/imagesloaded/assets/2D333F_2_0.woff2" %>
<%@include file="vendor/jquery.cookie/cookie.jquery.json" %>
<%@include file="vendor/jquery.cookie/MIT-LICENSE.txt" %>
<%@include file="vendor/jquery.cookie/component.json" %>
<%@include file="vendor/jquery.cookie/jquery.cookie.js" %>
<%@include file="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js" %>
<%@include file="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js" %>
<%@include file="vendor/jquery-countdown/jquery.countdown.min.js" %>
<%@include file="vendor/jquery-countdown/jquery.countdown.js" %>
<%@include file="vendor/bootstrap-select/.DS_Store" %>
<%@include file="vendor/bootstrap-select/css/bootstrap-select.css" %>
<%@include file="vendor/bootstrap-select/css/bootstrap-select.min.css" %>
<%@include file="vendor/bootstrap-select/js/.DS_Store" %>
<%@include file="vendor/bootstrap-select/js/bootstrap-select.js" %>
<%@include file="vendor/bootstrap-select/js/bootstrap-select.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-vi_VN.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ru_RU.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-zh_TW.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pl_PL.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-de_DE.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-da_DK.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fa_IR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-id_ID.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-kh_KM.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-it_IT.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sk_SK.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-it_IT.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-lv_LV.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ru_RU.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-hr_HR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sv_SE.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-es_ES.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pt_PT.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-da_DK.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-en_US.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-kh_KM.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-lv_LV.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-cs_CZ.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ar_AR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-hu_HU.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-et_EE.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pt_BR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fi_FI.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ar_AR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sv_SE.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ja_JP.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-bg_BG.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-zh_CN.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-et_EE.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ko_KR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ro_RO.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sl_SI.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-bg_BG.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-es_CL.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-cs_CZ.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-tr_TR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-nl_NL.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-nb_NO.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fr_FR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-id_ID.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pl_PL.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-nb_NO.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sk_SK.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pt_PT.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-am_ET.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-de_DE.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fa_IR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-pt_BR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-es_CL.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-am_ET.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-zh_TW.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fr_FR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-hu_HU.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-eu.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-vi_VN.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-fi_FI.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-hr_HR.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ua_UA.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-eu.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-en_US.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ko_KR.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-es_ES.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-nl_NL.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ua_UA.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-lt_LT.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ro_RO.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-sl_SI.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-zh_CN.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-lt_LT.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-ja_JP.min.js" %>
<%@include file="vendor/bootstrap-select/js/i18n/defaults-tr_TR.js" %>
<%@include file="vendor/masonry-layout/masonry.pkgd.min.js" %>
<%@include file="vendor/masonry-layout/masonry.pkgd.js" %>
<%@include file="vendor/font-awesome/css/font-awesome.css" %>
<%@include file="vendor/font-awesome/css/font-awesome.min.css" %>
<%@include file="vendor/font-awesome/HELP-US-OUT.txt" %>
<%@include file="vendor/font-awesome/fonts/fontawesome-webfont.svg" %>

<%@include file="vendor/font-awesome/fonts/fontawesome-webfont.woff2" %>
<%@include file="vendor/font-awesome/fonts/fontawesome-webfont.ttf" %>
<%@include file="vendor/font-awesome/fonts/fontawesome-webfont.woff" %>
<%@include file="vendor/font-awesome/fonts/fontawesome-webfont.eot" %>
<%@include file="vendor/nouislider/nouislider.css" %>
<%@include file="vendor/nouislider/nouislider.min.js" %>
<%@include file="vendor/nouislider/nouislider.js" %>
<%@include file="vendor/nouislider/nouislider.min.css" %>

</style>
</head>
<body>
    <!-- navbar-->
    <header class="header">
      <!-- Tob Bar-->
      <div class="top-bar">
        <div class="container-fluid">
          <div class="row d-flex align-items-center">
            <div class="col-lg-6 hidden-lg-down text-col">
              <ul class="list-inline">
                <li class="list-inline-item"><i class="icon-telephone"></i>800-456-747</li>
                <li class="list-inline-item">Free delivery on orders over $150</li>
              </ul>
            </div>
            <div class="col-lg-6 d-flex justify-content-end">
              <!-- Language Dropdown-->
              <div class="dropdown show"><a id="langsDropdown" href="https://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><img src="img/united-kingdom.svg" alt="english">English</a>
                <div aria-labelledby="langsDropdown" class="dropdown-menu"><a href="#" class="dropdown-item"><img src="img/germany.svg" alt="german">German</a><a href="#" class="dropdown-item"> <img src="img/france.svg" alt="french">French</a></div>
              </div>
              <!-- Currency Dropdown-->
              <div class="dropdown show"><a id="currencyDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">USD</a>
                <div aria-labelledby="currencyDropdown" class="dropdown-menu"><a href="#" class="dropdown-item">EUR</a><a href="#" class="dropdown-item"> GBP</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <nav class="navbar navbar-expand-lg">
        <div class="search-area">
          <div class="search-area-inner d-flex align-items-center justify-content-center">
            <div class="close-btn"><i class="icon-close"></i></div>
            <form action="#">
              <div class="form-group">
                <input type="search" name="search" id="search" placeholder="What are you looking for?">
                <button type="submit" class="submit"><i class="icon-search"></i></button>
              </div>
            </form>
          </div>
        </div>
        <div class="container-fluid">
          <!-- Navbar Header  --><a href="home" class="navbar-brand"><img src="img/logo.png" alt="..."></a>
          <button type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item dropdown"><a id="navbarHomeLink" href="home" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link active">Home<i class="fa fa-angle-down"></i></a>
                <ul aria-labelledby="navbarDropdownHomeLink" class="dropdown-menu">
                  <li><a href="home" class="dropdown-item">Home</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="category.html" class="nav-link">Shop</a>
              </li>
              <!-- Megamenu-->
              <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" class="nav-link">Template<i class="fa fa-angle-down"></i></a>
                <div class="dropdown-menu megamenu">
                  <div class="row">
                    <div class="col-lg-9">
                      <div class="row">
                        <div class="col-lg-3"><strong class="text-uppercase">Home</strong>
                          <ul class="list-unstyled">
                            <li><a href="home">City Sprouts - Home</a></li>
                          </ul><strong class="text-uppercase">Shop</strong>
                          <ul class="list-unstyled">
                            <li><a href="category.html">Category - left sidebar</a></li>
                            <li><a href="category-right.html">Category - right sidebar</a></li>
                            <li><a href="category-full.html">Category - full width</a></li>
                            <li><a href="category-masonry.html">Category - Masonry layout <span class="badge badge-success ml-2">New</span> </a></li>
                            <li><a href="detail.html">Product detail</a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3"><strong class="text-uppercase">Order process</strong>
                          <ul class="list-unstyled">
                            <li><a href="cart.html">Shopping cart</a></li>
                            <li><a href="checkout1.html">Checkout 1 - Address</a></li>
                            <li><a href="checkout2.html">Checkout 2 - Delivery</a></li>
                            <li><a href="checkout3.html">Checkout 3 - Payment</a></li>
                            <li><a href="checkout4.html">Checkout 4 - Review             </a></li>
                            <li><a href="checkout5.html">Checkout 5 - Confirmation             </a></li>
                          </ul><strong class="text-uppercase">Blog</strong>
                          <ul class="list-unstyled">
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="post.html">Post                                                                                           </a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3"><strong class="text-uppercase">Pages</strong>
                          <ul class="list-unstyled">
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="about.html">About us</a></li>
                            <li><a href="text.html">Text page</a></li>
                            <li><a href="faq.html">FAQ  <span class="badge badge-success ml-2">New</span></a></li>
                            <li><a href="coming-soon.html">Coming soon  <span class="badge badge-success ml-2">New</span></a></li>
                            <li><a href="404.html">Error 404</a></li>
                            <li><a href="500.html">Error 500</a></li>
                          </ul>
                        </div>
                        <div class="col-lg-3"><strong class="text-uppercase">Customer</strong>
                          <ul class="list-unstyled">
                            <li><a href="customer-login.html">Login/sign up</a></li>
                            <li><a href="customer-orders.html">Orders</a></li>
                            <li><a href="customer-order.html">Order detail</a></li>
                            <li><a href="customer-addresses.html">Addresses</a></li>
                            <li><a href="customer-account.html">Profile</a></li>
                          </ul>
                        </div>
                      </div>
                      <div class="row services-block">
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="item d-flex align-items-center">
                            <div class="icon"><i class="icon-truck text-primary"></i></div>
                            <div class="text"><span class="text-uppercase">Free delivery &amp; return</span><small>Free Shipping over $150</small></div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="item d-flex align-items-center">
                            <div class="icon"><i class="icon-coin text-primary"></i></div>
                            <div class="text"><span class="text-uppercase">Money back guarantee</span><small>10 Days Money Back</small></div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="item d-flex align-items-center">
                            <div class="icon"><i class="icon-headphones text-primary"></i></div>
                            <div class="text"><span class="text-uppercase">800-456-747</span><small>24/7 Available Support</small></div>
                          </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 d-flex">
                          <div class="item d-flex align-items-center">
                            <div class="icon"><i class="icon-secure-shield text-primary"></i></div>
                            <div class="text"><span class="text-uppercase">Secure Payment</span><small>Secure Payment</small></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-3 text-center product-col hidden-lg-down"><a href="detail.html" class="product-image"><img src="img/shirt.png" alt="..." class="img-fluid"></a>
                      <h6 class="text-uppercase product-heading"><a href="detail.html">Lose Oversized Shirt</a></h6>
                      <ul class="rate list-inline">
                        <li class="list-inline-item"><i class="fa fa-star-o text-primary"></i></li>
                        <li class="list-inline-item"><i class="fa fa-star-o text-primary"></i></li>
                        <li class="list-inline-item"><i class="fa fa-star-o text-primary"></i></li>
                        <li class="list-inline-item"><i class="fa fa-star-o text-primary"></i></li>
                        <li class="list-inline-item"><i class="fa fa-star-o text-primary"></i></li>
                      </ul><strong class="price text-primary">$65.00</strong><a href="#" class="btn btn-template wide">Add to cart</a>
                    </div>
                  </div>
                </div>
              </li>
              <!-- /Megamenu end-->
              <!-- Multi level dropdown    -->
              <li class="nav-item dropdown"><a id="navbarDropdownMenuLink" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">Dropdown<i class="fa fa-angle-down"></i></a>
                <ul aria-labelledby="navbarDropdownMenuLink" class="dropdown-menu">
                  <li><a href="#" class="dropdown-item">Action</a></li>
                  <li><a href="#" class="dropdown-item">Another action</a></li>
                  <li class="dropdown-submenu"><a id="navbarDropdownMenuLink2" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">Dropdown link<i class="fa fa-angle-down"></i></a>
                    <ul aria-labelledby="navbarDropdownMenuLink2" class="dropdown-menu">
                      <li><a href="#" class="dropdown-item">Action</a></li>
                      <li class="dropdown-submenu"><a id="navbarDropdownMenuLink3" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link">

                          Another action<i class="fa fa-angle-down"></i></a>
                        <ul aria-labelledby="navbarDropdownMenuLink3" class="dropdown-menu">
                          <li><a href="#" class="dropdown-item">Action</a></li>
                          <li><a href="#" class="dropdown-item">Action</a></li>
                          <li><a href="#" class="dropdown-item">Action</a></li>
                          <li><a href="#" class="dropdown-item">Action</a></li>
                        </ul>
                      </li>
                      <li><a href="#" class="dropdown-item">Something else here</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <!-- Multi level dropdown end-->
              <li class="nav-item"><a href="blog.html" class="nav-link">Blog </a>
              </li>
              <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a>
              </li>
            </ul>
            <div class="right-col d-flex align-items-lg-center flex-column flex-lg-row">
              <!-- Search Button-->
              <div class="search"><i class="icon-search"></i></div>
              <!-- User Not Logged - link to login page-->
              <div class="user"> <a id="userdetails" href="customer-login.html" class="user-link"><i class="icon-profile">                   </i></a></div>
              <!-- Cart Dropdown-->
              <div class="cart dropdown show"><a id="cartdetails" href="https://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="icon-cart"></i>
                  <div class="cart-no">1</div></a><a href="cart.html" class="text-primary view-cart">View Cart</a>
                <div aria-labelledby="cartdetails" class="dropdown-menu">
                  <!-- cart item-->
                  <div class="dropdown-item cart-product">
                    <div class="d-flex align-items-center">
                      <div class="img"><img src="img/hoodie-man-1.png" alt="..." class="img-fluid"></div>
                      <div class="details d-flex justify-content-between">
                        <div class="text"> <a href="#"><strong>Heather Gray Hoodie</strong></a><small>Quantity: 1 </small><span class="price">$75.00 </span></div><a href="#" class="delete"><i class="fa fa-trash-o"></i></a>
                      </div>
                    </div>
                  </div>
                  <!-- total price-->
                  <div class="dropdown-item total-price d-flex justify-content-between"><span>Total</span><strong class="text-primary">$75.00</strong></div>
                  <!-- call to actions-->
                  <div class="dropdown-item CTA d-flex"><a href="cart.html" class="btn btn-template wide">View Cart</a><a href="checkout1.html" class="btn btn-template wide">Checkout</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </header>
    <!-- Hero Section-->
    <section class="hero hero-home no-padding">
      <!-- Hero Slider-->
      <div class="owl-carousel owl-theme hero-slider">
        <div style="background: url(img/hero-bg.jpg);" class="item d-flex align-items-center has-pattern">
          <div class="container">
            <div class="row">
              <div class="col-lg-6 text-white">
                <h1>City Sprouts</h1>
                <ul class="lead">
                  <li><strong>Connecting Urban Grows to the Local Market</strong>   </li>
                  <li><strong>150</strong> cities, <strong>2</strong> countries</li>
                  <!-- <li><strong></strong></li>
                  <li><strong></strong></li> -->
                </ul><a href="#" class="btn btn-template wide shop-now">Shop Now<i class="icon-bag"> </i></a>
              </div>
            </div>
          </div>
        </div>
        <div style="background: url(img/hero-bg-2.jpg);" class="item d-flex align-items-center">
          <div class="container">
            <div class="row">
              <div class="col-lg-6 text-white">
                <h1>City Sprouts</h1>
                <ul class="lead">
                <li><strong>Buy Local!</strong> </li>
                <li>Support your local community. Sustainable and super fresh.</li>
              </ul>
                <a href="#" class="btn btn-template wide shop-now">Shop Now<i class="icon-bag">  </i></a>
              </div>
            </div>
          </div>
        </div>
        <div style="background: url(img/hero-bg-3.jpg);" class="item d-flex align-items-center">
          <div class="container">
            <div class="row">
              <div class="col-lg-6 text-white">
                <h1>City Sprouts</h1>
                <ul class="lead">
                  <li><strong>Too busy to drive to the market?</strong> </li>
                  <li>Delivery available!</li>
                </ul>
                <a href="#" class="btn btn-template wide shop-now">Shop Now<i class="icon-bag">           </i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Categories Section-->
    <section class="categories">
      <div class="container">
        <header class="text-center">
          <h2 class="text-uppercase"><small>Freshest produce around!</small>Our Featured Picks</h2> <!--@@ fore through inventory item.lastUpdated -->
        </header>
        <div class="row text-left">
        
        <c:if test="${! empty fresh }">
			<c:forEach var="fresh" items="${fresh}">
	          <div class="col-lg-4"><a href="#">
              	<div style="background-image: url(${fresh.imgUrl});" class="item d-flex align-items-end">
               	 <div class="content">
                  <h3 class="h5">${fresh.commodity.name }</h3><span><br>$${fresh.price}<br>${fresh.picked }</span>
                </div>
              </div></a></div>
			</c:forEach>
       	</c:if>
              
        </div>
      </div>
    </section>
    <!-- Men's Collection -->
    <section class="men-collection gray-bg">
      <div class="container">
        <header class="text-center">
          <h2 class="text-uppercase"><small>Random items</small>Top Picks...</h2>
        </header>
        <!-- Products Slider-->
        <div class="owl-carousel owl-theme products-slider">
          <!-- item-->
          
         <c:if test="${! empty random }">
          <c:forEach var="random" items="${random}">
           <div class="item">
            <div class="product is-gray">
              <div class="image d-flex align-items-center justify-content-center"><img src="${random.imgUrl}" alt="product" class="img-fluid">
                <div class="hover-overlay d-flex align-items-center justify-content-center">
                  <div class="CTA d-flex align-items-center justify-content-center"><a href="#" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a><a href="detail.html" class="visit-product active"><i class="icon-search"></i>${random.commodity.name}</a><a href="#" data-toggle="modal" data-target="#exampleModal" class="quick-view"><i class="fa fa-arrows-alt"></i></a></div>
                </div>
              </div>
              <div class="title"><a href="detail.html">
                  <h3 class="h6 text-uppercase no-margin-bottom">${random.picked } </h3></a><span class="price text-muted">$${random.price }</span></div>
            </div>
          </div>
		 </c:forEach>
       	</c:if>
       	
    <section class="categories">
      <div class="item d-flex align-items-center">
      <div class="container">
        <header class="text-center">
          <h2><small>Get it local...</small>Find your Urban Farmer</h2>
          </header>
          <h3>Denver Area</h3>
          <div class="image d-flex align-items-center justify-content-center">
            <iframe width="800" height="400" frameborder="0" style="border:0"
                src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJzxcfI6qAa4cR1jaKJ_j0jhE&key=AIzaSyDAxjvHqQQNx3ZZLcUiMDuQB3uQwitKsKY" allowfullscreen>
            </iframe>
          </div>
        </div>
      </div>
    </section>
  <!-- Brands Section-->
    <section class="brands">
      <div class="container">
        <!-- Brands Slider-->
        <div class="owl-carousel owl-theme brands-slider">
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-1.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-2.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-3.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-4.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-5.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-6.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-1.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-2.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-3.svg" alt="..." class="img-fluid"></div>
          </div>
          <!-- item-->
          <div class="item d-flex align-items-center justify-content-center">
            <div class="brand d-flex align-items-center"><img src="img/brand-4.svg" alt="..." class="img-fluid"></div>
          </div>
        </div>
      </div>
    </section>
    <!-- Overview Popup    -->
    <div id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true" class="modal fade overview">
      <div role="document" class="modal-dialog">
        <div class="modal-content">
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="icon-close"></i></span></button>
          <div class="modal-body">
            <div class="ribbon-primary text-uppercase">Sale</div>
            <div class="row d-flex align-items-center">
              <div class="image col-lg-5"><img src="img/shirt.png" alt="..." class="img-fluid d-block"></div>
              <div class="details col-lg-7">
                <h2>Lose Oversized Shirt</h2>
                <ul class="price list-inline">
                  <li class="list-inline-item current">$65.00</li>
                  <li class="list-inline-item original">$90.00</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                <div class="d-flex align-items-center">
                  <div class="quantity d-flex align-items-center">
                    <div class="dec-btn">-</div>
                    <input type="text" value="1" class="quantity-no">
                    <div class="inc-btn">+</div>
                  </div>
                  <select id="size" class="bs-select">
                    <option value="small">Small</option>
                    <option value="meduim">Medium</option>
                    <option value="large">Large</option>
                    <option value="x-large">X-Large</option>
                  </select>
                </div>
                <ul class="CTAs list-inline">
                  <li class="list-inline-item"><a href="#" class="btn btn-template wide"> <i class="fa fa-shopping-cart"></i>Add to Cart</a></li>
                  <li class="list-inline-item"><a href="#" class="visit-product active btn btn-template-outlined wide"> <i class="icon-heart"></i>Add to wishlist</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="scrollTop"><i class="fa fa-long-arrow-up"></i></div>
    <!-- Footer-->
    <footer class="main-footer">
      <!-- Service Block-->
      <div class="services-block">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 d-flex justify-content-center justify-content-lg-start">
              <div class="item d-flex align-items-center">
                <div class="icon"><i class="icon-truck"></i></div>
                <div class="text">
                  <h6 class="no-margin text-uppercase">Free delivery &amp; return</h6><span>Free Delivery over $150</span>
                </div>
              </div>
            </div>
            <div class="col-lg-4 d-flex justify-content-center">
              <div class="item d-flex align-items-center">
                <div class="icon"><i class="icon-coin"></i></div>
                <div class="text">
                  <h6 class="no-margin text-uppercase">Money back guarantee</h6><span>10 Days Money Back Guarantee</span>
                </div>
              </div>
            </div>
            <div class="col-lg-4 d-flex justify-content-center">
              <div class="item d-flex align-items-center">
                <div class="icon"><i class="icon-headphones"></i></div>
                <div class="text">
                  <h6 class="no-margin text-uppercase">800-456-747</h6><span>24/7 Available Support</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Main Block -->
      <div class="main-block">
        <div class="container">
          <div class="row">
            <div class="info col-lg-4">
              <div class="logo"><img src="img/logo.png" alt="..."></div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              <ul class="social-menu list-inline">
                <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fa fa-pinterest"></i></a></li>
                <li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fa fa-vimeo"></i></a></li>
              </ul>
            </div>
            <div class="site-links col-lg-2 col-md-6">
              <h5 class="text-uppercase">Shop</h5>
              <ul class="list-unstyled">
                <li> <a href="#">For Women</a></li>
                <li> <a href="#">For Men</a></li>
                <li> <a href="#">Stores</a></li>
                <li> <a href="#">Our Blog</a></li>
                <li> <a href="#">Shop</a></li>
              </ul>
            </div>
            <div class="site-links col-lg-2 col-md-6">
              <h5 class="text-uppercase">Company</h5>
              <ul class="list-unstyled">
                <li> <a href="#">Login</a></li>
                <li> <a href="#">Register</a></li>
                <li> <a href="#">Wishlist</a></li>
                <li> <a href="#">Our Products</a></li>
                <li> <a href="#">Checkouts</a></li>
              </ul>
            </div>
            <div class="newsletter col-lg-4">
              <h5 class="text-uppercase">Daily Offers & Discounts</h5>
              <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
              <form action="#" id="newsletter-form">
                <div class="form-group">
                  <input type="email" name="subscribermail" placeholder="Your Email Address">
                  <button type="submit"> <i class="fa fa-paper-plane"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="text col-md-6">
              <p>&copy; 2018<a href="https://ondrejsvestka.cz" target="_blank">Ondrej Svestka </a> All rights reserved.</p>
            </div>
            <div class="payment col-md-6 clearfix">
              <ul class="payment-list list-inline-item pull-right">
                <li class="list-inline-item"><img src="img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img src="img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img src="img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img src="img/western-union.svg" alt="..."></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="vendor/nouislider/nouislider.min.js"></script>
    <script src="vendor/jquery-countdown/jquery.countdown.min.js"></script>
    <script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
    <script src="vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <!-- masonry -->

    <!-- Main Template File-->
    <script src="js/front.js"></script>
  </body>
</html>
