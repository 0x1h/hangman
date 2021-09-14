$gameWords = ["forward", "image", "impostor", "fortnite", "half-life", "Gordon Freeman", "confront"]
$current = ""
i = 0
$lives = 5

class HangMan
    def initialize(words)
        @words = words
    end

    def getRandomNumber
        randomNumber = rand(@words.length)
    end
end

hangman = HangMan.new($gameWords)
hangman.getRandomNumber

$current = $gameWords[hangman.getRandomNumber]

$splitedword = $current.split("", $current.length)
$template = ""

while i < $current.length
    if($splitedword[i] === " ")
        $template += " "
    elsif $splitedword[i] === "-" then
        $template += "-"
    else 
        $template += "_"
    end
    i = i + 1
end

puts $template

def checkTemplate(checkString, userInput)
    k = 0
    j = 0

    matchedDigits = []

    while k < checkString.length
        if(checkString[k] === userInput) 
            matchedDigits.push k
        elsif(!checkString.include?(userInput)) 
            $lives = $lives - 1
            break
        end
        k = k + 1
    end

    matchedDigits.each do |digits|
        $template[digits] = userInput
    end
    
end


def userInput
    if($lives === 0)
        puts "You have no more lives Game over :("
        exit
    end

    if(!$template.include?("_"))
        puts "Congrats You Won The Game!"
        exit
    end

    input = gets.chomp

    puts checkTemplate($splitedword, input)

    puts $template
    puts "Lives you have left: #{$lives}"
    
    userInput
end

userInput