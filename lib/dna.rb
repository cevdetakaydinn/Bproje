
require 'matrix'
m = Matrix.build(5, 5) {|row, col| ('a'..'z').to_a[rand(26)] }
class Dna
  #@@midpoint
  def initialize(curriculum,day,hr)
    rnd=Random.new
    @Chromosome= Hash.new
    @highestGrade=Departmentlesson.maximum(:grade)
    i = 1
    while i<=@highestGrade
      @Chromosome[i]=Array.new(day){Array.new(hr)}
      i=i+1
    end

    curriculum.each do |cur|
      curCurrent=cur.first
      if !(curCurrent.nil?)
        dp = Departmentlesson.find(curCurrent.departmentlesson_id)
        hour = dp.hour_amount
        currentGrade = dp.grade

        i=0
        while i < hour
          rday=rnd.rand(day)
          rhour=rnd.rand(hr)
            if @Chromosome[currentGrade][rday][rhour].blank?
              @Chromosome[currentGrade][rday][rhour]=curCurrent.id
              i=i+1
            end
        end
      end

    end
    # @genes=Matrix.build(Day.all.size, Lessonhour.all.size) {|row, col| curriculum[rand((Lessonhour.all.size*Day.all.size)-curriculum.size)] }
  end

  def getGen
    @Chromosome
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
