# nested_start
# Удаление одного сотрудника
@delete_one_wp = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_wps = ->
  $('a.remove_worker').on 'click', ->
    window.delete_one_wp($(this))
    false
  false
# Включаем кнопку добавления сотрудника
@add_new_wp = ->
  $('#add_worker_link').on 'click', ->
    # Подменяем временный id с фразой new_wp на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_worker", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом
    # window.datepicker_activation_by_item(panel)
    # Включаем у нового сотрудника кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_worker').on 'click', ->
      window.delete_one_wp($(this))
      false
    false
# Запуск всего вышеописанного
wp_ready = ->
  window.add_new_wp()
  window.del_all_wps()
$(document).on 'page:load', wp_ready # Включаем при ajax обновлении страницы
$(document).ready wp_ready # Включаем при обычном обновлении страницы
# nested_finish
