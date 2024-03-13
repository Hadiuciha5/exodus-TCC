extends RichTextLabel

var text1 ="story_1"
var text2 = "story_2"
var text3 = "story_3"
var text4 = "story_4"
var currentTextIndex = 0
var texts = [text1, text2, text3, text4]

func _ready()->void:
	scroll_text(texts[currentTextIndex])
	
func scroll_text(input_text:String)->void:
	visible_characters = 0
	text = input_text
	
	for i in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
	
	currentTextIndex += 1
	if currentTextIndex < texts.size():
		await get_tree().create_timer(1.0).timeout  # Delay sebentar sebelum menampilkan teks selanjutnya
		scroll_text(texts[currentTextIndex])
