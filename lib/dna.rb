
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  #@@midpoint
  def initialize(curriculum,day,hr)
    rnd=Random.new
    @genes=Array.new(day){Array.new(hr)}
    curriculum.each do |cur|
      hour= Departmentlesson.find(cur[0].departmentlesson_id).hour_amount
      curCurrent=cur[0].id
      i=0
      while i < hour
        rday=rnd.rand(day)
        rhour=rnd.rand(hr)
        if @genes[rday][rhour].blank?
          @genes[rday][rhour]=curCurrent
          i=i+1
        end
      end
    end
    # @genes=Matrix.build(Day.all.size, Lessonhour.all.size) {|row, col| curriculum[rand((Lessonhour.all.size*Day.all.size)-curriculum.size)] }
  end

  def getGen
    @genes
  end
  def crossover(partner)

  end

  def mutation(mRate)
    #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
  end

  def fitness
    @score=0
    @array=Array.new
    self.getGen.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if !(modul.blank?)
          #Aynı saatteki bütün dersleri bul
          @ws = Weeklyschedule.where(day_id:row , lessonhours_id:col)
          @cur=Curriculum.find(modul)

          @ws.each do |ws|
            #hoca çakışması kontrol
            if @cur.admin.id != ws.curriculum.admin.id
              @score = @score + 1
              # elsif #Sınıf çakışması yoksa ve sınıf kontenjanı yetiorsa
              #    @score = @score + 1
              # elsif #Aynı sınıfın başka dersi yoksa
              #   @score = @score + 1
            end
          end
        end
      end
    end
    return @score
  end
end
