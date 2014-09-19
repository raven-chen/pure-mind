module ApplicationHelper
  def menus
    menu_tree = [
          [  "首页", root_path ],

          [[ "案例展示", root_path ],
            [[ "恢复案例", root_path ],
             [ "恢复日记", root_path ],
             [ "语音访谈", root_path ]]],

          [[ "健康功法", root_path ],
            [[ "山背套餐", root_path ],
             [ "蹲墙套餐", root_path ],
             [ "辅助功法", root_path ]]],

          [[ "1对1定制", root_path ],
            [[ "报名定制", root_path ],
            [[ "打卡区", root_path ],
              [[ "精彩打卡", root_path ],
               [ "定制打卡", root_path ],
               [ "非定制打卡", root_path ],
               [ "精英班打卡", root_path ]]],
             [ "作业区", root_path ]]],

          [[ "关于思无邪", root_path ],
            [[ "思无邪简介", root_path ],
             [ "健康分析表", root_path ],
             [ "思无邪微信", root_path ],
             [ "义工培训", root_path ],
             [ "最新活动", root_path ]]],
          [  "问答社区", root_path ]]

    menu_elements = []

    menu_tree.each do |menu|
      menu_elements << generate_sub_menus(menu_elements, menu, "top-level")
    end

    content_tag(:ul, menu_elements.join.html_safe)
  end

  def generate_sub_menus menu_elements, menu, li_class = nil
    return content_tag(:li, content_tag(:a, menu.first, :href => menu.last)) if !menu[1].is_a?(Array)

    current_menu = menu[0]
    sub_menus_content = menu[1].map {|sub_menu| generate_sub_menus menu_elements, sub_menu }

    sub_menus = content_tag(:ul, sub_menus_content.join.html_safe, :class => "sub-nav")
    content_tag(:li, content_tag(:a, current_menu.first, :href => current_menu.last ) + sub_menus, :class => li_class)
  end

end
