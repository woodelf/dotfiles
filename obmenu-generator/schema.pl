#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    raw:       any valid Openbox XML string               {raw => q(xml string)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
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
    #          COMMAND                 LABEL                ICON
    {item => ['xdg-open .',        '文件管理器',        'file-manager']},
    {item => ['sakura',            '终端',              'terminal']},
    {item => ['xdg-open http://',  '网络浏览器',        'web-browser']},
    {item => ['gmrun',             '运行命令',          'system-run']},
    {item => ['pidgin',            '即时通信',          'system-users']},

    {sep => '应用程序'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     '附件',        'applications-utilities']},
    {cat => ['development', '开发',        'applications-development']},
    {cat => ['education',   '教育',        'applications-science']},
    {cat => ['game',        '游戏',        'applications-games']},
    {cat => ['graphics',    '图形',        'applications-graphics']},
    {cat => ['audiovideo',  '多媒体',      'applications-multimedia']},
    {cat => ['network',     '网络',        'applications-internet']},
    {cat => ['office',      '办公',        'applications-office']},
    {cat => ['other',       '其他',        'applications-other']},
    {cat => ['settings',    '设置',        'applications-accessories']},
    {cat => ['system',      '系统',        'applications-system']},

    #{cat => ['qt',          'QT Applications',    'qt4logo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL          ICON
    #{begin_cat => ['My category',  'cat-icon']},
    #             ... some items ...
    #{end_cat   => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'openbox']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {begin_cat => ['高级设置', 'gnome-settings']},

        # Configuration files
        #{item      => ["$editor ~/.conkyrc",              'Conky RC',    $editor]},
        {item      => ["$editor ~/.config/tint2/tint2rc", 'Tint2 面板', $editor]},

        # obmenu-generator category
        {begin_cat => ['Obmenu-Generator', 'menu-editor']},
            {item      => ["$editor ~/.config/obmenu-generator/schema.pl", '菜单结构', $editor]},
            {item      => ["$editor ~/.config/obmenu-generator/config.pl", '菜单配置', $editor]},

            {sep  => undef},
            {item => ['obmenu-generator -p',    '生成管道菜单',                      'menu-editor']},
            {item => ['obmenu-generator -s',    '生成静态菜单',                      'menu-editor']},
            {item => ['obmenu-generator -p -i', '生成带图标的管道菜单',              'menu-editor']},
            {item => ['obmenu-generator -s -i', '生成带图标的静态菜单',              'menu-editor']},
            {sep  => undef},

            {item    => ['obmenu-generator -d', '刷新图标集', 'gtk-refresh']},
        {end_cat => undef},

        # Openbox category
        {begin_cat => ['Openbox', 'openbox']},
            {item      => ['openbox --reconfigure',               '重新配置 Openbox',   'openbox']},
            {item      => ["$editor ~/.config/openbox/autostart", 'Openbox 自启动程序',   $editor]},
            {item      => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',           $editor]},
            {item      => ["$editor ~/.config/openbox/menu.xml",  'Openbox 菜单',         $editor]},
        {end_cat => undef},

        # Pacman category
        #{begin_cat => ['Pacman / Servers', 'package-manager-icon']},
        #    {item      => ["gksu $editor /etc/makepkg.conf",        'Makepkg Config',    'start-here']},
        #    {item      => ["gksu $editor /etc/pacman.conf",         'Pacman Config',     'start-here']},
        #    {item      => ["gksu $editor /etc/pacman.d/mirrorlist", 'Pacman Mirrorlist', 'start-here']},
        #{end_cat => undef},
    {end_cat => undef},
    {sep => undef},

    ## The xscreensaver lock command
    {item => ['xscreensaver-command -lock', '锁定', 'lock']},

    # This option uses the default Openbox's action "Exit"
    {exit => ['退出', 'exit']},
]
