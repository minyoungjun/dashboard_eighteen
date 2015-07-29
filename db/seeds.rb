#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

1.upto(12) do |clock|
  timing = Timing.new
  timing.name = "#{clock}시"
  timing.save
end

token = Fbtoken.new
token.token = "CAAIINCifRTEBAA1LkOvI9R9MVjLwIgNRZApNVslaHDQ4QnuZAD4xXBedzAk39SBC4ypWdKWNwQyKyJN5Fbuv04WahyENO38dnrnhsYqi3gQHlwHa8PMXMCvg6ReVDzLYE4p9EMv5joZAUDM8EdiTjrcleRHApQDiCMqaDAZBlZCiWXFGV4o7MdfxMZANpSz8AqJzGImIpoHv6ZAqfduGc3A"
token.page_id = "100508786966555"
token.save

[["월급도둑","동네오빠","PLN655gxqfVS-qtyPo74YrBNO5jqTRw2PJ"], ["영국남자","영국남자","PLN655gxqfVS8YO4Z2SU9P0OQgAjucIG3d"], ["건강소유","소유","PLN655gxqfVS8tREtNKrFcrQCFjibgEgTU"], ["표셜록","표창원","PLN655gxqfVS9rHN56K9ZGP3i65z61ImEo"],["파리갓나영", "김나영","PLN655gxqfVS9onoA8AUToxBayvkUJPH3w"], ["바보가면","김종민","PLN655gxqfVS9DcX8crWJ9jC8MOF4ocEPa"], ["아티스트봉","봉만대","PLN655gxqfVS_4KhBwm-B6fakbHHLsAbQb"], ["엑소목소리","찬열","PLN655gxqfVS-PVtVAUD9Cp-VHi6hro2LR"]].each do |name|
  celeb = Celeb.new
  celeb.hashtag = name[0]
  celeb.name = name[1]
  celeb.playlist = name[2]
  celeb.save
  

end

