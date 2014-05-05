{if !$REPORTICO_AJAX_CALLED}
{if !$EMBEDDED_REPORT}
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>{$TITLE}</TITLE>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEET}">
{if $BOOTSTRAP_STYLES}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap.min.css">
{/if}
{$OUTPUT_ENCODING}
</HEAD>
<BODY class="swMntBody">
<p>
{else}
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEET}">
{if $BOOTSTRAP_STYLES}
{if !$REPORTICO_BOOTSTRAP_PRELOADED}
<LINK id="bootstrap_css" REL="stylesheet" TYPE="text/css" HREF="{$STYLESHEETDIR}/bootstrap.min.css">
{/if}
{/if}
{/if}
{if $AJAX_ENABLED}
{if !$REPORTICO_AJAX_PRELOADED}
{if !$REPORTICO_JQUERY_PRELOADED}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/jquery.js"></script>
{/literal}
{/if}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/ui/jquery.ui.datepicker.js"></script>
{/literal}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/reportico.js"></script>
{/literal}
{/if}
{if $BOOTSTRAP_STYLES}
{if !$REPORTICO_BOOTSTRAP_PRELOADED}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/bootstrap.min.js"></script>
{/literal}
{/if}
{/if}
{/if}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/ui/i18n/jquery.ui.datepicker-{/literal}{$AJAX_DATEPICKER_LANGUAGE}{literal}.js"></script>
{/literal}
{if !$BOOTSTRAP_STYLES}
{literal}
<script type="text/javascript" src="{/literal}{$JSPATH}{literal}/jquery.jdMenu.js"></script>
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/jquery.jdMenu.css">
{/literal}
{/if}
{literal}
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/ui/themes/base/jquery.ui.base.css">
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/ui/themes/base/jquery.ui.theme.css">
<LINK id="reportico_css" REL="stylesheet" TYPE="text/css" HREF="{/literal}{$JSPATH}{literal}/ui/themes/base/jquery.ui.datepicker.css">
<script type="text/javascript">var reportico_datepicker_language = "{/literal}{$AJAX_DATEPICKER_FORMAT}{literal}";</script>
<script type="text/javascript">var reportico_this_script = "{/literal}{$SCRIPT_SELF}{literal}";</script>
<script type="text/javascript">var reportico_ajax_script = "{/literal}{$REPORTICO_AJAX_RUNNER}{literal}";</script>
<script type="text/javascript">var reportico_ajax_mode = "{/literal}{$REPORTICO_AJAX_MODE}{literal}";</script>
{/literal}
{/if}
<div id="reportico_container">
<FORM class="swMntForm" name="topmenu" method="POST" action="{$SCRIPT_SELF}">
<H1 class="swTitle">{$TITLE}</H1>
{if strlen($STATUSMSG)>0} 
			<TABLE class="swStatus">
				<TR>
					<TD>{$STATUSMSG}</TD>
				</TR>
			</TABLE>
{/if}
{if strlen($ERRORMSG)>0} 
			<TABLE class="swError">
				<TR>
					<TD>{$ERRORMSG}</TD>
				</TR>
			</TABLE>
{/if}
<input type="hidden" name="session_name" value="{$SESSION_ID}" />
{if $SHOW_TOPMENU}
	<TABLE class="swMntTopMenu">
		<TR>
{if ($DB_LOGGEDON)} 
			<TD class="swPrpTopMenuCell">
{if ($DBUSER)}
Logged On As {$DBUSER}
{else}
&nbsp;
{/if}
			</TD>
{/if}
{if strlen($MAIN_MENU_URL)>0} 
			<TD style="text-align: left;">
				<a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" href="{$MAIN_MENU_URL}">{$T_PROJECT_MENU}</a>
{if ($SHOW_ADMIN_BUTTON)}
				&nbsp;<a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" href="{$ADMIN_MENU_URL}">{$T_ADMIN_MENU}</a>
{/if}
				&nbsp;<a class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" href="{$RUN_REPORT_URL}">{$T_RUN_REPORT}</a>
				&nbsp;<input class="{$BOOTSTRAP_STYLE_ADMIN_BUTTON}swLinkMenu" type="submit" name="submit_prepare_mode" style="display:none" onclick="return(false);" value="Do nothing on enter">
			</TD>
{/if}
{if $SHOW_MODE_MAINTAIN_BOX && 0}
			<TD style="text-align: left;">
				<input class="swMntButton" type="submit" name="submit_genws_mode" value="{$T_GEN_WEB_SERVICE}">
			</TD>
			<TD style="text-align: right;">
			</TD>
{/if}
{if $SHOW_LOGOUT}
			<TD style="width:15%; text-align: right; padding-right: 10px;" align="right" class="swPrpTopMenuCell">
				<input class="{{$BOOTSTRAP_STYLE_ADMIN_BUTTON}}swLinkMenu" type="submit" name="logout" value="{$T_LOGOFF}">
			</TD>
{/if}
{if $SHOW_LOGIN}
			<TD style="width: 50%"></TD>
			<TD style="width: 35%" align="right" class="swPrpTopMenuCell">
{if strlen($PROJ_PASSWORD_ERROR) > 0}
                                <div style="color: #ff0000;">{$PASSWORD_ERROR}</div>
{/if}
				{$T_DESIGN_PASSWORD_PROMPT} <input type="password" name="project_password" value="">
			</TD>
			<TD style="width: 15%" align="right" class="swPrpTopMenuCell">
				<input class="btn btn-sm btn-default swPrpSubmit" type="submit" name="login" value="{$T_LOGIN}">
			</TD>
{/if}
		</TR>
	</TABLE>
{/if}
	<TABLE class="swMntMainBox" cellspacing="0" cellpadding="0">
		<TR>
			<TD>
{$CONTENT}
			</TD>
		</TR>
	</TABLE>
</FORM>
<div class="smallbanner">Powered by <a href="http://www.reportico.org/" target="_blank">reportico {$REPORTICO_VERSION}</a></div>
</div>
{if !$REPORTICO_AJAX_CALLED}
{if !$EMBEDDED_REPORT}
</BODY>
</HTML>
{/if}
{/if}
