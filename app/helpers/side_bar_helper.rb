module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Ссылка без детей',
      :icon => 'list',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'Сотрудники',
      :icon => 'mortar-board',
      :children => [
      {:name => 'Добавление',
       :controller => :workers, :action => :new,
       :icon => 'plus'},
      {:name => 'Редактирование',
       :controller => :workers, :action => :index,
       :icon => 'cog',
       :class => 'long'}
    ]}
    result << {
      :name => 'Проекты',
      :icon => 'handshake-o',
      :children => [
      {:name => 'Добавление',
       :controller => :projects, :action => :new,
       :icon => 'plus'},
      {:name => 'Редактирование',
       :controller => :projects, :action => :index,
       :icon => 'cog',
       :class => 'long'}
    ]}
    result << {
      :name => 'Заголовок ссылок',
      :icon => 'search-plus',
      :children => [
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'binoculars'},
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'search',
       :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
