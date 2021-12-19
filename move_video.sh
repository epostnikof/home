#!/usr/bin/env bash
photo=/home/mrrobot/big_data_HDD_789GB/Foto_video                                 # путь до папки с фото. Крайне настоятельно не рекомендую использовать относительные пути. Лучше один раз задать абсолютный путь в переменной, чем потом мучаться.
netdir=/home/mrrobot/big_data_HDD_789GB/net_ford/
dirs=$(find $photo -type d | grep -v Видеозаписи | grep -vi видео | grep -v anim) # фильтр по которому будет формироваться нужный список папок. По названиям понятно, что исключены нынешние и будующая папка с видео. Название anin выбратно не случайно (см. мой путь до корневой папки).
net_dirs=$(find $netdir -type d | grep -v Видеозаписи | grep -vi видео | grep -v anim)


###PHOTO###
for var in $(echo $dirs)                                                          # Начало цикла. В цикл добавляем вывод из переменной dirs.
do                              # То с чего обязательно начинается цикл.
cd $var                         # перемешаемся в папку из цикла
mkdir anim 2>/dev/null          # создаём папку anin
mv -v *.mp4 anim 2>/dev/null    # перемещаем
mv -v *.MP4 anim 2>/dev/null    #           всё
mv -v *.mkv anim 2>/dev/null    #                что
mv -v *.MKV anim 2>/dev/null    #                     надо
mv -v *.AVI anim 2>/dev/null    #                           переместить
mv -v *.avi anim 2>/dev/null    #                                       в эту
mv -v *.3gp anim 2>/dev/null    #                                              папку
mv -v *.3GP anim 2>/dev/null    #                                                       этими действиями
rm -v *.pp3 2>/dev/null         #  удаляем хлам, который мог остаться в папках
done
                       # То, чем должен завершаться цикл
###NET###
for var2 in $(echo $net_dirs)
do
cd $var2
mkdir anim 2>/dev/null          # создаём папку anin
mv -v *.mp4 anim 2>/dev/null    # перемещаем
mv -v *.MP4 anim 2>/dev/null    #           всё
mv -v *.mkv anim 2>/dev/null    #                что
mv -v *.MKV anim 2>/dev/null    #                     надо
mv -v *.AVI anim 2>/dev/null    #                           переместить
mv -v *.avi anim 2>/dev/null    #                                       в эту
mv -v *.3gp anim 2>/dev/null    #                                              папку
mv -v *.3GP anim 2>/dev/null   #
done

##SYNC WITH net_ford###
photo_dir=/home/mrrobot/big_data_HDD_789GB/Foto_video/По_годам/2021/Смартфон/ #
net_dir=/home/mrrobot/big_data_HDD_789GB/net_ford/

find $photo -type d -name anim -exec rmdir {} \;# удаляем пустые папки для видео. 
find $net_dirs -type d -name anim -exec rmdir {} \;


rsync -azvh --progress $net_dir $photo_dir # синрхронизируем с параметрамми -a -- Режим архивирования, когда сохраняются все атрибуты оригинальных файлов; z--Сжимать файлы перед передачей; -v -- Выводить подробную информацию о процессе копирования; -H - Копировать жесткие ссылки; --progress -- покажет шкалу прогресса;
