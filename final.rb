require 'rubygems'
require 'gosu'



class GameWindow < Gosu::Window
  def initialize
    super 602, 451
    self.caption = "PACMAN"

    @background_image = Gosu::Image.new('clip_image002_2.jpg', :tileable => true)
    @player = Gosu::Image.new("pacman_right.jpg")
    @player1 = Gosu::Image.new("pacman.jpg")
    @player2 = Gosu::Image.new("pacman_down.jpg")
    @player3 = Gosu::Image.new("pacman_up.jpg")
    @player4 = Gosu::Image.new("pacman_left.jpg")
    @enemy = Gosu::Image.new("inky.jpg")
    @dots = Gosu::Image.new("dot.jpg")
    @start = Gosu::Sample.new("pacman_beginning.wav")
    @start.play
    @eat = Gosu::Sample.new("pacman_chomp.wav")
    @die = Gosu::Sample.new("pacman_death.wav")
@dot_cover = Gosu::Image.new("black.jpg")
    @score = 0
    @lives = 3
  end


  $a = 290
  $b = 150
  $x = 290
  $y = 310
  @player_position = [$x, $y, 0]
  @enemy_position = [$a, $b, 0]
  def draw

    @background_image.draw(0, 0, 0)
    @player1.draw($x, $y, 0)
    @enemy.draw($a, $b, 0)
    random_move1 = $a + 1
    random_move2 = $a - 1
    random_move3 = $b + 1
    random_move4 = $b - 1
    random_selection = [random_move1, random_move2].sample
    random_selection2 = [random_move3, random_move4].sample
    selection3 = [random_selection, random_selection2].sample
    @enemey_position = selection3
    if selection3 == random_selection then
      if random_selection == random_move1 then
        $a = $a + 1
      else
        $a = $a - 1
      end
    end
    if selection3 == random_selection2 then
      if random_selection2 == random_move3 then
        $b = $b + 1
      else
        $b = $b - 1
      end
    end
    if @lives == 3
      @player.draw(20, 420, 0)
      @player.draw(45, 420, 0)
      @player.draw(70, 420, 0)
    end
    if @lives == 2
      @player.draw(20, 420, 0)
      @player.draw(45, 420, 0)
    end
    if @lives == 1
      @player.draw(20, 420, 0)
    end
    @dot_locations = {}
    @dots_array = []
    y = 38
    20.times do
      @dots_array.push y
      y = y + 16.5
    end
    @dots_array.each do |variable|
      @point185 = [185, variable , 0]
      @dot_locations["185x"] = @point185
      @dots.draw(185, variable , 0)
    end
    @dots_array.each do |variable|
      @point410 = [410, variable, 0]
      @dot_locations["410x"] = @point410
      @dots.draw(410, variable , 0)
    end
    @dots_array2 = []
    x = 110
    24.times do
      @dots_array2.push x
      x = x + 16.5
    end

    @dots_array2.each do |variable|
      if variable != 291.5 && variable != 308 then
        @point25 = [variable, 25,0]
        @dot_locations["25"] = @point25
        @dots.draw(variable, 25, 0)
      end
    end
    @dots_array2.each do |variable|
      @point395 = [variable, 395, 0]
      @dot_locations["395"] = @point395
      @dots.draw(variable, 395, 0)
    end
    @dot_arrays3 = []
    y = 41
    21.times do
      @dot_arrays3.push y
      y = y + 16.8
    end
    @dot_arrays3.each do |variable|
      if variable != @dot_arrays3[6] &&
          variable != @dot_arrays3[7] &&
          variable != @dot_arrays3[8] &&
          variable != @dot_arrays3[9] &&
          variable != @dot_arrays3[10] &&
          variable != @dot_arrays3[11] &&
          variable != @dot_arrays3[12] &&
          variable != @dot_arrays3[13] &&
          variable != @dot_arrays3[17] &&
          variable != @dot_arrays3[18] then
        @pointy489 = [489, variable, 0]
        @dot_locations["y489"] = @pointy489
        @dots.draw(489, variable, 0)
      end
    end
    @dot_arrays3.each do |variable|
      if variable != @dot_arrays3[6] &&
          variable != @dot_arrays3[7] &&
          variable != @dot_arrays3[8] &&
          variable != @dot_arrays3[9] &&
          variable != @dot_arrays3[10] &&
          variable != @dot_arrays3[11] &&
          variable != @dot_arrays3[12] &&
          variable != @dot_arrays3[13] &&
          variable != @dot_arrays3[17] &&
          variable != @dot_arrays3[18] then
        @pointy110 = [110, variable, 0]
        @dot_locations["110y"] = @pointy110

        @dots.draw(110, variable, 0)
      end
    end
    @dot_arrays4 = []
    x = 121
    23.times do
      @dot_arrays4.push x
      x = x + 16
    end
    @dot_arrays4.each do |variable|
      if variable != @dot_arrays4[4] && variable != @dot_arrays4[18] then
        @pointy80 = [variable, 80, 0]
        @dot_locations["80y"] = @pointy80
        @dots.draw(variable, 80, 0)
      end
    end
    @dot_arrays4.each do |variable|
      if variable != @dot_arrays4[4] && variable != @dot_arrays4[18] && variable != @dot_arrays4[11] then
        @pointy276 = [variable, 276, 0]
        @dot_locations["276y"] = @pointy276
        @dots.draw(variable, 276, 0)
      end
    end
    @dot_arrays4.each do |variable|
      if variable != @dot_arrays4[4] &&
          variable != @dot_arrays4[5] &&
          variable != @dot_arrays4[6] &&
          variable != @dot_arrays4[11] &&
          variable != @dot_arrays4[16] &&
          variable != @dot_arrays4[17] &&
          variable != @dot_arrays4[18] then
        @pointy120 = [variable, 120, 0]
        @dot_locations["y120"] = @pointy120
        @dots.draw(variable, 120, 0)
      end
    end
    @dot_arrays4.each do |variable|
      if variable != @dot_arrays4[2] &&
          variable != @dot_arrays4[3] &&
          variable != @dot_arrays4[11] &&
          variable != @dot_arrays4[18] &&
          variable != @dot_arrays4[19] &&
          variable != @dot_arrays4[20] then
        @pointy317 = [variable, 317, 0]
        @dot_locations["y317"] = @pointy317
        @dots.draw(variable, 317, 0)
      end
    end
    @dot_arrays4.each do |variable|
      if variable != @dot_arrays4[4] &&
          variable != @dot_arrays4[5] &&
          variable != @dot_arrays4[6] &&
          variable != @dot_arrays4[11] &&
          variable != @dot_arrays4[16] &&
          variable != @dot_arrays4[17] &&
          variable != @dot_arrays4[18] then
        @pointy355 = [variable, 355, 0]
        @dot_locations["y355"] = @pointy
        @dots.draw(variable, 355, 0)
      end
    end


    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      $x = $x - 1
        @player4.draw($x, $y, 0)
        @dots_array.each do |variable|
          if $x < 190 && $x > 180 && $y == variable
            @dot_cover.draw(185, variable, 0)
          @score = @score + 10
          @eat.play
        end
        if $x > 405 && x < 415 && $y == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dots_array2.each do |variable|
        if $y > 15 && $y < 25 && $x == variable
          @score = @score + 10
          @eat.play
        end
        if $y > 390 && $y < 400 && $x == variable
        @score = @score + 10
        @eat.play
        end
        end
      @dot_arrays3.each do |variable|
        if $x > 100 && $x < 120 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 379 && $x < 399 && $y == variable
          @score = @score + 10
          @eat.play
        end
        @dot_arrays4.each do |variable|
          if $y > 70 && $y < 90 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 266 && $y < 286 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 110 && $y < 130 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 307 && $y < 317 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 345 && $y < 365 && $x == variable
            @score = @score + 10
            @eat.play
          end
          end
      end
      if $a == $x && $b == $y then
        @lives = @lives - 1
        @die.play
        @player1.draw(290, 310, 0)
        if @lives == 0
          Gosu::KbEscape
          puts "GAME OVER"
        end

      end
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      $x = $x + 1
@player1.draw($x, $y, 0)
      @dots_array.each do |variable|
        if $x < 190 && $x > 180 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 405 && x < 415 && $y == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dots_array2.each do |variable|
        if $y > 15 && $y < 25 && $x == variable
          @score = @score + 10
          @eat.play
        end
        if $y > 390 && $y < 400 && $x == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dot_arrays3.each do |variable|
        if $x > 100 && $x < 120 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 379 && $x <399 && $y == variable
          @score = @score + 10
          @eat.play
        end
        @dot_arrays4.each do |variable|
          if $y > 70 && $y < 90 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 266 && $y < 286 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 110 && $y < 130 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 307 && $y < 327 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 345 && $y < 365 && $x == variable
            @score = @score + 10
            @eat.play
          end
        end
      end
      if $a == $x && $b == $y then
        @lives = @lives - 1
        @die.play
        @player1.draw(290, 310, 0)
        if @lives == 0
          Gosu::KbEscape
          puts "GAME OVER"
        end
      end
      end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
      $y = $y - 1
      @player3.draw($x, $y, 0)
      @dots_array.each do |variable|
        if $x < 190 && $x > 180 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 405 && x < 415 && $y == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dots_array2.each do |variable|
        if $y > 15 && $y < 25 && $x == variable
          @score = @score + 10
          @eat.play
        end
        if $y > 390 && $y < 400 && $x == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dot_arrays3.each do |variable|
        if $x > 100 && $x < 120 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 379 && $x <399 && $y == variable
          @score = @score + 10
          @eat.play
        end
        @dot_arrays4.each do |variable|
          if $y > 70 && $y < 90 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 266 && $y < 286 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 110 && $y < 130 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 307 && $y < 327 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 345 && $y < 365 && $x == variable
            @score = @score + 10
            @eat.play
          end
        end
      end
      if $a == $x && $b == $y then
        @lives = @lives - 1
        @die.play
        @player1.draw(290, 310, 0)
        if @lives == 0
          Gosu::KbEscape
          puts "GAME OVER"
        end
      end
      end
    if Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpButton1 then
      $y = $y + 1
      @player2.draw($x, $y, 0)
      @dots_array.each do |variable|
        if $x < 190 && $x > 180 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 405 && x < 415 && $y == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dots_array2.each do |variable|
        if $y > 15 && $y < 25 && $x == variable
          @score = @score + 10
          @eat.play
        end
        if $y > 390 && $y < 400 && $x == variable
          @score = @score + 10
          @eat.play
        end
      end
      @dot_arrays3.each do |variable|
        if $x > 100 && $x < 120 && $y == variable
          @score = @score + 10
          @eat.play
        end
        if $x > 379 && $x <399 && $y == variable
          @score = @score + 10
          @eat.play
        end
        @dot_arrays4.each do |variable|
          if $y > 70 && $y < 90 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 266 && $y < 286 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 110 && $y < 130 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 307 && $y < 327 && $x == variable
            @score = @score + 10
            @eat.play
          end
          if $y > 345 && $y < 365 && $x == variable
            @score = @score + 10
            @eat.play
          end
        end
      end
      if $a == $x && $b == $y then
        @lives = @lives - 1
        @die.play
        @player1.draw(290, 310, 0)
        if @lives == 0
          puts "GAME OVER"
          Game.close
          window.close

          exit
        end
    end
    end
    puts @score

  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show