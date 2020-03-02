require_relative('song.rb')
require_relative('guest.rb')
require_relative('room.rb')
require("pry")

class Karaoke_Bar

  attr_reader :name, :entry_fee, :till
  attr_accessor :rooms

  def initialize(name, rooms, entry_fee)
    @name= name
    @rooms= rooms
    @entry_fee= entry_fee
    @till= 0
  end

  def check_in_guests(guests, room)
    if guests.any?{|guest| guest.age<18}
      p reject_guests("one of the guests being underage")
    elsif guests.count()>room.size
      p reject_guests("the selected room being too small")
    else
      if determine_if_guests_have_enough_money(guests)
        @rooms[room]= guests
        charge_guests_entry_fee(guests)
      else
        p reject_guests("a lack of funds")
      end
    end
  end

  def check_out_guests(room)
    @rooms[room]= nil
  end

  def make_new_room(name, size, songs)
    new_room= Room.new(name, size, songs)
    @rooms[new_room]= nil
  end

  def remove_room(room_to_be_removed)
    if @rooms.keys().any?{|room| room.name==room_to_be_removed}
      @rooms.delete(@rooms.keys().find{|room| room.name==room_to_be_removed})
    end
  end

  def count_guests_cash(guests)
    return guests.inject(0){|total, guests| total + guests.cash}
  end

  def determine_if_guests_have_enough_money(guests)
    total_cash= count_guests_cash(guests)
    entry_fee_total = @entry_fee*guests.count()
    return true if total_cash >= entry_fee_total
  end

  def charge_guests_entry_fee(guests)
    entry_fee_total= @entry_fee*guests.count()
    total_cash= count_guests_cash(guests)
    total_cash-=entry_fee_total
    @till+=entry_fee_total
    for guest in guests
      guest.cash= total_cash.to_f()/(guests.count())
    end
  end

  def reject_guests(reason)
    return "Sorry, but you are not allowed to come here becasuse of #{reason}."
  end

  def guest_finds_his_favourite_song(guests, room)
    for guest in guests
      if room.songs.any?{|song| song.title==guest.favourite_song}
        return "Whoo"
      else
      end
    end
    return "Oh ok"
  end

end
