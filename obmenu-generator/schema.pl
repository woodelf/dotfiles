#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL              ICON
    {item => ['xdg-open .',       '文件管理器', 'system-file-manager']},
    {item => ['sakura',           '终端',     'utilities-terminal']},
    {item => ['xdg-open http://', '网络浏览器',  'web-browser']},
    {item => ['gmrun',            '运行命令',  'system-run']},

    {sep => '分类'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     '附件', 'applications-utilities']},
    {cat => ['development', '开发', 'applications-development']},
    {cat => ['education',   '教育', 'applications-science']},
    {cat => ['game',        '游戏', 'applications-games']},
    {cat => ['graphics',    '图形', 'applications-graphics']},
    {cat => ['audiovideo',  '多媒体',  'applications-multimedia']},
    {cat => ['network',     '网络', 'applications-internet']},
    {cat => ['office',      '办公', 'applications-office']},
    {cat => ['other',       '其他', 'applications-other']},
    {cat => ['settings',    '设置', 'applications-accessories']},
    {cat => ['system',      '系统', 'applications-system']},

    #                  LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['高级设置', 'applications-engineering']},

      # Configuration files
      {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 面板', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", '菜单结构', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", '菜单配置', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    '生成静态菜单',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', '生成带图标的静态菜单',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       '生成动态菜单',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    '生成带图标的动态菜单', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', '刷新缓存', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'Openbox 自启动',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox 菜单',        'text-x-generic']},
        {item => ['openbox --reconfigure',               '重新配置 Openbox', 'openbox']},
      {end => undef},
    {end => undef},

    {sep => undef},

    ## The xscreensaver lock command
    {item => ['xscreensaver-command -lock', '锁定', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
    {exit => ['退出', 'application-exit']},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'application-exit']},
]
