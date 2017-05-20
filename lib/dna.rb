
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  #@@midpoint
  def initialize(curriculum,day,hr)
    rnd=Random.new
    @genes=Array.new(day){Array.new(hr)}

    curriculum.each do |cur|
      hour= Departmentlesson.find(cur[0].departmentlesson_id).hour_amount
      curCurrent=cur[0].departmentlesson.lesson.name
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
    self.getGen.each do |gen|
      gen.each do |modul|
        @array<<modul
        # if #Hoca çakışması yoksa
        #   @score = @score + 1
        # elsif #Sınıf çakışması yoksa
        #   @score = @score + 1
        # elsif #Aynı sınıfın başka dersi yoksa
        #   @score = @score + 1
        # end
      end
    end
    return @array
  end
end
