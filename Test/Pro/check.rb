puts("----------------------------------------")
puts("                  1.1")
puts("----------------------------------------")
asa = nil
asa = [1,2]
puts("asa#{asa}")
print("defined?: ", defined? asa);puts()
print("nil?: ", asa.nil?);puts()
print("empty?: ", asa.empty?);puts()
#print("blank?: ");print(asa.blank?);puts()
#print("presence?: ");print(asa.presence?);puts()
puts("----------------------------------------")
puts("                  1.2")
puts("----------------------------------------")
local = 1
Const = 1
$global = 1
@instance = 1
@@class = 1
print("local: ", defined?(local));puts()
print("Const: ", defined?(Const));puts()
print("$global: ", defined?($global));puts()
print("@instance: ", defined?(@instance));puts()
print("@@class: ", defined?(@@class));puts()

puts("----------------------------------------")
puts("                  1.3")
puts("----------------------------------------")
sample = []
print("isArray: ", sample.instance_of?(Array));puts();
print("class: ", sample.class);puts();
