<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="value[typeAction/name='showFeedbackHTML']">

        <xsl:variable name="doc" select="typifiedObject/documents"/>
        <xsl:if test="$doc">
            <xsl:variable name="backgroundColor" select="'0x323A3F'"/>
            <div id="{typifiedObject/emsObject/systemName}" class="{typeAction/name}">
                <div class="html-content">
                    <xsl:value-of select="$doc/xmlSource/HtmlCode/html" disable-output-escaping="yes"/>
                </div>

                <link rel="stylesheet" type="text/css" href="{$blockPrefix}/resource/css/jquery/jquery-ui.css"/>
                <link rel="stylesheet" type="text/css" href="{$servletPath}/css/types/Content/Content-showFeedbackHTML.css"/>

                <!--Chenged Place Lib-->
                <script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/jquery-1.5.1.min.js"/>
        <script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/jquery-ui-1.8.11.custom.min.js"/>

                <!--<script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/jquery.js"/>-->
                <!--<script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/jquery-ui.js"/>-->
                <script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/jquery.validate.pack.js"/>
                <script type="text/javascript" src="{$blockPrefix}/resource/js/jquery/messages_{$locale}.js"/>
                <script language="javascript">
                    $(document).ready(function() {
                        var validator = $("#send-letter-form").validate();
                        var formHTML = $('#form-div').html();
                        $("#send-input").click(function() {
                            if ($("#send-letter-form").valid()) {
                                $.post("<xsl:value-of select="$blockPrefix"/>/service/sendletter", $("#send-letter-form").serialize(),
                                    function(data){
                                        var errors = 0;
                                        if(data['form']) {
                                            $('#message-div').html(data['form']);
                                        }
                                        else {
                                            validator.showErrors(data);
                                            for (var fieldId in data) {
                                                errors++;
                                            }
                                            if (errors == 0) {
                                                var formDivObj = $('#form-div');
                                                formDivObj.html('Ваше сообщение отправлено! Спасибо!');
                                                formDivObj.css('text-align', 'center');
                                            }
                                        }

                                   },"json");
                            }
                        });
                        $('#send-letter-dialog').dialog({
                            autoOpen: false,
                            width: 422,
                            resizable: false,
                            close: function(event, ui){
                        	var formDivObj = $('#form-div');
                                formDivObj.html(formHTML);
                                formDivObj.css('text-align', 'right');
                            },
                            buttons: {
                            }
                        });

                        $('.showFeedbackHTML .activate').click(function() {
                            $('#send-letter-dialog').dialog('open');
                            return false;
                        });
                        $('#captcha-img').click(function() {
                            var now = new Date();
                            this.src = '<xsl:value-of select="$blockPrefix"/>/service/captcha?background=<xsl:value-of
                        select="$backgroundColor"/>&amp;' + now.getTime();
                        });
                    });
                </script>
                <div id="send-letter-dialog" title="Написать письмо">
                    <div id="form-div">
                        <form action="{$servletPath}/{$sitemapPath}/sendletter" method="post" id="send-letter-form">
                            <div id="info-div">*Все поля обязательны для заполнения</div>
                            <div id="message-div"/>
                            <div id="name-div"><label for="name-input">Имя</label><input type="text" name="name-input" id="name-input" class="required" minlength="2"/></div>
                            <div id="email-div"><label for="email-input">Email</label><input type="text" name="email-input" id="email-input" class="required email"/></div>
                            <div id="content-div"><label for="content-textarea">Текст письма</label><textarea name="content-textarea" id="content-textarea" class="required"/></div>
                            <div id="captcha-div"><label for="captcha-input">Введите текст, изображенный на картинке</label><img id="captcha-img" src="{$blockPrefix}/service/captcha?background={$backgroundColor}"/><input type="text" id="captcha-input" name="captcha-input" class="required" minlength="5"/></div>
                            <div id="send-div"><input type="button" class="ui-button ui-state-default ui-corner-all " id="send-input" name="send-input" value="Отправить письмо"/></div>
                        </form>
                    </div>
                </div>
            </div>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>