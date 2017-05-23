
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
    #bu ve parterin genlerinin yarılarını al birleştir.Ve 2 tane çocuk geri döndür.
  end

  def mutation(mRate)
    #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
    i=0
    while i<@genes.length
      #genes deki bütün id ler bi listeye koy .rand(list.size-1) ile rasgele birini seç ve on ait  dersleri başka yere koy
      if rand<mRate
        # @genes[i]=
      end
    end
  end

  def fitness
    @score=0
    self.getGen.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if !(modul.blank?)
          #Aynı saatteki bütün dersleri bul
          ws = Weeklyschedule.where(day_id:row , lessonhours_id:col)
          cur=Curriculum.find(modul)
          curgrade=cur.departmentlesson.grade

          ws.each do |wc|
            #hoca çakışması kontrol
            wsc=wc.curriculum
            if cur.admin.id != wsc.admin.id
              @score = @score + 1
              # elsif #Sınıf çakışması yoksa ve sınıf kontenjanı yetiorsa
              #    @score = @score + 1
            #Aynı sınıfın başka dersi varmı
            elsif cur.departmentlesson.grade != wsc.departmentlesson.grade
                @score = @score + 1
            end
          end
        end
      end
    end
    return @score
  end
end
