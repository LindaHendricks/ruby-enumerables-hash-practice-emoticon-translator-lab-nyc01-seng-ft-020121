require 'yaml'



def load_library (file_path)
  file = YAML.load_file(file_path)
  new_lib = {}
  
  file.each do |name, array_of_emoji|
    new_lib[name] = {:english => {}, :japanese => {}}
    array_of_emoji.each_with_index do |emoji, index|
      if index == 0
        new_lib[name][:english] = emoji
      elsif index == 1
        new_lib[name][:japanese] = emoji
      end
    end
  end
  new_lib
end


def get_english_meaning(file_path, emoji)
  new_lib = load_library(file_path)
  e_meaning = " "
  
  new_lib.each do |n, v|
    if emoji == v[:japanese]
      return e_meaning = n
    else
       e_meaning = "Sorry, that emoticon was not found"
    end
  end
  e_meaning
end


def get_japanese_emoticon (file_path, emoji)
  new_lib = load_library(file_path)
  jap_emoti = " "

  new_lib.each do |n, v|
    if emoji == v[:japanese]  #my mistake is here I can't find why
      return jap_emoti = n 
       else
       jap_emoti = "Sorry, that emoticon was not found"
    end
  end
  jap_emoti
end


