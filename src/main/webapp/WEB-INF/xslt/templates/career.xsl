<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <!--<xsl:apply-templates select="systemNode/objects[position = 1]" />-->
    <xsl:import href="../import/header.xsl"/>
    <xsl:import href="../import/footer.xsl"/>
    <xsl:template name="scripts">
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.js"/>
    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">

        <xsl:variable name="backgroundColor" select="'0xF7F7F7'"/>


        <xsl:call-template name="header"/>
        <div class="content">

            <div class="center">

                <div class="info">
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 6]/value"/>


                </div>
                <div class="main">
                    <h1>Карьера в Kremnev Atelier</h1>

                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 5]/value"/>
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 9]/value"/>
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 10]/value"/>
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 7]/value"/>
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 8]/value"/>

                    <script src="{$servletPath}/{$sitemapPath}js/jquery/jquery-ui.custom.min.js"
                            type="text/javascript"></script>
                    <script type="text/javascript"
                            src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>
                    <link media="screen"
                          href="{$servletPath}/{$sitemapPath}js/flowplayer/css/form.css"
                          type="text/css"
                          rel="stylesheet"/>
                    <!--<div class="utils">
                        <a class="rss" href="#">RSS рассылка вакансий</a>
                    </div>-->


                    <!--

                    <script type="text/javascript">

                        // supply the language
                        $("ul.tabs").tabs("div.panes > div");


                        $.tools.validator.localize("ru", {
                        '*' : 'Virheellinen arvo',
                        ':email' : 'Неверный еmail',
                        ':number' : 'Только цифры',
                        ':url' : 'Неверный URL',
                        '[max]' : 'Максимум $1',
                        '[min]' : 'Минимум $1',
                        '[required]' : 'Заполните это поле!!!'
                        });

                        // use the finnish language in the validator

                        $("#sendForm").validator({ lang: 'ru' });


                    </script>-->
                </div>
                <div class="extra">
                    <div class="reserve">
                        <script type="text/javascript"
                                src="{$servletPath}/{$sitemapPath}js/jquery/jquery.validate.pack.js"/>
                        <script type="text/javascript"
                                src="{$servletPath}/{$sitemapPath}js/jquery/messages_{$locale}.js"/>

                        <xsl:variable name="formMessage" select="/root/params/parameters/param[@name='form']"/>
                        <xsl:variable name="successMessage" select="/root/params/parameters/param[@name='success']"/>
                        <xsl:variable name="captchaMessage"
                                      select="/root/params/parameters/param[@name='captcha-input2']"/>


                        <script type="text/javascript">

                            function is_array (a) {
                            return (typeof a == "object") &amp;&amp; (a instanceof Array);
                            }


                            $(function() {
                            $("ul.tabs").tabs("div.panes > div", {
                            effect: 'slide',
                            });

                            var validator1 = $("#send-letter-form1").validate();
                            var validator2 = $("#send-letter-form2").validate();
                            var formHTML = $('#form-div').html();
                            $("#send-button1").click(function() {
                            if ($("#send-letter-form1").valid()) {
                            $.post("<xsl:value-of select="$blockPrefix"/>/service/sendletter",
                            $("#send-letter-form1").serialize(),
                            function(data){
                            var ans = data['answer'];
                            var answers = {};
                            if (is_array(ans)) {
                            for (var row in ans) {
                            answers[ans[row]['name']] = ans[row]['value'];
                            }
                            }
                            else {
                            answers[ans['name']] = ans['value'];
                            }
                            var errors = 0;
                            if(answers['success']) {
                            alert(answers['success']);
                            }
                            else if(answers['form']) {
                            $('#message-div1').html(answers['form']);
                            }
                            else {
                            validator1.showErrors(answers);
                            }

                            },"json");
                            }
                            });
                            $("#send-button2").click(function() {
                            if ($("#send-letter-form2").valid()) {
                            document.getElementById('send-letter-form2').submit();
                            }
                            });

                            $('.captcha-img').each(function() {
                            $(this).click(function() {
                            var now = new Date();
                            $('.captcha-img').each(function() {
                            this.src = '<xsl:value-of select="$blockPrefix"/>/service/captcha?background=<xsl:value-of
                                select="$backgroundColor"/>&amp;' + now.getTime();
                            });
                            });
                            });


                            <xsl:if test="$formMessage or $captchaMessage or $successMessage">
                                var api = $("ul.tabs").data("tabs");
                                api.click(1);
                                alert('<xsl:value-of select="$successMessage"/>');
                            </xsl:if>
                            });


                        </script>

                        <table>
                            <tr>
                                <td>
                                    <div class="description">
                                        Если вы не нашли свободной вакансии на которую вы могли бы
                                        претендовать,
                                        оставьте своё резюме, при необходимости мы с вами свяжемся.
                                    </div>
                                </td>
                                <td>
                                    <h1>Внешний резерв</h1>
                                    <div class="form">

                                        <ul class="tabs">
                                            <li><a href="#">Заполнить форму</a>&nbsp;или
                                            </li>
                                            <li>
                                                <a href="#">загрузить резюме</a>
                                            </li>
                                        </ul>


                                        <!--<h2>заполнить форму или <a>Загрузить резюме</a></h2>-->
                                        <div class="panes">

                                            <div>
                                                <form id="send-letter-form1" method="post"
                                                      action="{$blockPrefix}/service/sendletter">
                                                    <div id="message-div1" class="error"/>
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td>
                                                                <label for="fio">ФИО:</label>
                                                            </td>
                                                            <td>
                                                                <label for="position">Должность:</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="text" required="required"
                                                                       class="text required" id="fio" name="fio"/>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="text required"
                                                                       required="required" id="position"
                                                                       name="position"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="info">Краткая информация о себе.
                                                                </label>
                                                                <span>*образование, стаж, опыт работы.
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <label for="contacts">Контактная информация:
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <textarea id="info" required="required"
                                                                          class="text required" name="info"/>
                                                            </td>
                                                            <td class="contacts">
                                                                <textarea required="required" id="contacts"
                                                                          class="text required" name="contacts"/>
                                                                <!-- <input type="button" class="button"
                                                                value="Отправить"
                                                                id="send"/>-->
                                                                <div id="captcha-div1">
                                                                    <label for="captcha-input1">Введите текст,
                                                                        изображенный на картинке
                                                                    </label>
                                                                    <img class="captcha-img"
                                                                         src="{$blockPrefix}/service/captcha?background={$backgroundColor}"/>
                                                                    <input type="text" id="captcha-input1"
                                                                           name="captcha-input1" class="text required"
                                                                           minlength="5"/>
                                                                </div>
                                                                <button type="button" id="send-button1" class="button">
                                                                    Отправить
                                                                </button>
                                                                <!--<button type="reset" class="button">Очистить</button>-->

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </form>
                                            </div>
                                            <div>
                                                <form id="send-letter-form2" method="post" enctype="multipart/form-data"
                                                      action="{$blockPrefix}/service/sendletter">
                                                    <div id="message-div2" class="error">
                                                        <xsl:value-of
                                                                select="$formMessage"/>
                                                    </div>
                                                    <input type="file" class="text required" name="file"/>
                                                    <div id="captcha-div2">
                                                        <label for="captcha-input2">Введите текст, изображенный на
                                                            картинке
                                                        </label>
                                                        <img class="captcha-img"
                                                             src="{$blockPrefix}/service/captcha?background={$backgroundColor}"/>
                                                        <input type="text" id="captcha-input2" name="captcha-input2"
                                                               class="text required" minlength="5"/>
                                                        <xsl:if test="$captchaMessage">
                                                            <label class="error" for="captcha-input2" generated="true">
                                                                <xsl:value-of
                                                                        select="$captchaMessage"/>
                                                            </label>
                                                        </xsl:if>
                                                    </div>
                                                    <button type="button" id="send-button2" class="button">
                                                        Отправить
                                                    </button>
                                                </form>
                                            </div>
                                        </div>


                                    </div>
                                </td>
                            </tr>
                        </table>


                    </div>
                    <!--<div class="list">-->

                    <!--<h1>Отчетность</h1>-->
                    <!--<ul>-->
                    <!--<li><a href="#">Корпоративные</a></li>-->
                    <!--<li><a href="#">Социальные</a></li>-->
                    <!--<li><a href="#">Бухгалтерский</a></li>-->
                    <!--<li><a href="#">Отчеты эмитета</a></li>-->

                    <!--<li><a href="#">Внутренние документы</a></li>-->
                    <!--<li><a href="#">Финансовая отчетность по МСФО</a></li>-->
                    <!--</ul>-->
                    <!--<div class="additional"><a href="#">Сведения о соблюдении Обществом кодекса корпоративного поведения</a></div>-->
                    <!--</div>-->
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 11]/value"/>

                    <!--<div class="files">-->
                    <!--<h1>Отчеты за 2011 год</h1>-->

                    <!--<ul>-->
                    <!--<li><a href="#">Корпоративный отчет 2011</a><a class="img" href="#"><img src="{$servletPath}/img/pdf.png" alt=""/></a><span>Формат ПДФ, 7Мб.</span></li>-->
                    <!--<li><a href="#">Социальный отчет 2011</a><a class="img" href="#"><img src="{$servletPath}/img/pdf1.png" alt=""/></a><span>Формат ПДФ, 6,3Мб.</span></li>-->
                    <!--</ul>-->
                    <!--</div>-->
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 12]/value"/>

                    <div class="clear"></div>
                </div>

                <div class="print">
                    <!--<a href="#">
                        <i18n:text key="Page.printVersion"/>
                    </a>-->
                </div>
            </div>
        </div>


        <xsl:call-template name="footer"/>

    </xsl:template>

</xsl:stylesheet>