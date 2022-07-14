# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  bulls = 0
  cows = 0
  secret_occurences = {}

  secret.each_char do |char|
    secret_occurences[char] ||= 0
    secret_occurences[char] += 1
  end

  (0..guess.length - 1).each do |i|
   # next
    if secret_occurences[guess[i]]
      if secret[i] == guess[i]
        bulls += 1

        if secret_occurences[guess[i]] <= 0
          cows -= 1
        end
      elsif secret_occurences[guess[i]] > 0
        cows += 1
      end
      secret_occurences[guess[i]] -= 1
    end
  end
  "#{bulls}A#{cows}B"
end


p get_hint('1807', '7810')