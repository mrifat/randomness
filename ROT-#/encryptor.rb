class Encryptor
  def cipher(rotation)
    Hash[(' '..'z').to_a.zip((' '..'z').to_a.rotate(rotation))]
  end

  def encrypt(rotation, letter)
    cipher_with_rotation = cipher(rotation)
    cipher_with_rotation[letter]
  end

  def decrypt(rotation, letter)
    cipher_with_rotation = cipher(rotation)
    cipher_with_rotation.key(letter)
  end


  def encrypt(rotation, string)
    cipher_with_rotation = cipher(rotation)
    string.split('').collect { |letter| cipher_with_rotation[letter] }.join
  end

  def decrypt(rotation, string)
    cipher_with_rotation = cipher(rotation)
    string.split('').map { |letter| cipher_with_rotation.key(letter) }.join
  end

  def encrypt_file(rotation, file_uri)
    cipher_with_rotation = cipher(rotation)
    File.open("#{file_uri}_encrypted", 'w') { |file| file.write(File.open(file_uri, 'r').read.split('').map { |letter| cipher_with_rotation[letter] }.join) } unless File.zero?(file_uri) &&  File.directory?(file_uri) &&  File.executable?(file_uri) && File.owned?(file_uri)
  end

  def decrypt_file(rotation, file_uri)
    cipher_with_rotation = cipher(rotation)
    File.open("#{file_uri}_decrypted", 'w') { |file| file.write(File.open(file_uri, 'r').read.split('').map { |letter| cipher_with_rotation.key(letter) }.join) } unless File.zero?(file_uri) &&  File.directory?(file_uri) &&  File.executable?(file_uri) && File.owned?(file_uri)
  end
end
