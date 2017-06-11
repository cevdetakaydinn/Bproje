
class Dna
  attr_accessor :score, :genes
  def initialize(curriculum,day,hr)
    @@day= day
    @@hour= hr
    @@curriculum=curriculum
    rnd = Random.new
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
          if @genes[rday][rhour+1].blank?&& i<hour
            @genes[rday][rhour+1]=curCurrent
            i=i+1
          end
        end
      end
    end
    # @genes=Matrix.build(@@day, @@hour) {|row, col| curriculum[rand((@@hour*@@day)-curriculum.size)] }
  end
  def getScore
    @score
  end
  def getGen
    @genes
  end
  def crossover(partner)
    #bu ve parterin genlerinin yarılarını al birleştir.Ve 2 tane çocuk geri döndür.
    child1=Dna.new(@@curriculum,@@day,@@hour)
    child2=Dna.new(@@curriculum,@@day,@@hour)
    birey = @genes
    birey2 = partner.genes
    day=@@day
    hr=@@hour
    bir_1_array=Array.new
    bir_2_array=Array.new
    child_1_array=Array.new(day){Array.new(hr)}
    child_1_array2=Array.new(day){Array.new(hr)}
    child_2_array=Array.new(day){Array.new(hr)}
    child_2_array2=Array.new(day){Array.new(hr)}
    # Ders programlarını derslere göre böl
    birey.each do |x|
      x.each do |y|
        if !(bir_1_array.include? y) && y!=nil
          bir_1_array<<y
        end
      end
    end
    kalanlar=bir_1_array.size-bir_1_array.size/2
    k=0
    while k<bir_1_array.size/2
      bir_2_array<<bir_1_array[k]
      k=k+1
    end
    bir_1_array -= bir_2_array

    z=0
    while z<bir_1_array.size+bir_2_array.size
      birey.each_with_index do |m,gun|
        m.each_with_index do |l,saat|
          if l==bir_1_array[z]
            child_1_array[gun][saat] = l
          end 
          if l==bir_2_array[z]
            child_1_array2[gun][saat] = l
          end
        end
      end
      birey2.each_with_index do |m,gun|
        m.each_with_index do |l,saat|
          if l==bir_1_array[z]
            child_2_array[gun][saat] = l
          end 
          if l==bir_2_array[z]
            child_2_array2[gun][saat] = l
          end 
        end
      end
      z += 1
    end
    #Ders programlarını birleştir ve çocuklara ata ayrıca hata kontrol yap
    child1.genes=Array.new(day){Array.new(hr)}
    child2.genes=Array.new(day){Array.new(hr)}

    #Zaman yetişirse tekrarı önleyecek şekilde düzenlenmesi lazım
    
    #child1 in 1. yarısı
    child_1_array.each_with_index do |d,gun|
      d.each_with_index do |h,saat|
        unless h.nil?
          if child1.genes[gun][saat].nil? 
            child1.genes[gun][saat]=h
          #boş değilse çakışma var
          else
            #rasgele boş yere koy
            k=true
            while k
              g=rand(day)
              s=rand(hr)
              if child1.genes[g][s].nil?
                child1.genes[g][s]=h
                k=false
              end
            end
          end
        end
      end
    end

    #child1 in  2.yarısı
    child_2_array2.each_with_index do |d,gun|
      d.each_with_index do |h,saat|
        unless h.nil?
          if child1.genes[gun][saat].nil? 
            child1.genes[gun][saat]=h
          #boş değilse çakışma var
          else
            #rasgele boş yere koy
            k=true
            while k
              g=rand(day)
              s=rand(hr)
              if child1.genes[g][s].nil?
                child1.genes[g][s]=h
                k=false
              end
            end
          end
        end
      end
    end

    #child2 in 1. yarısı
    child_1_array2.each_with_index do |d,gun|
      d.each_with_index do |h,saat|
        unless h.nil?
          if child2.genes[gun][saat].nil? 
            child2.genes[gun][saat]=h
          #boş değilse çakışma var
          else
            #rasgele boş yere koy
            k=true
            while k
              g=rand(day)
              s=rand(hr)
              if child2.genes[g][s].nil?
                child2.genes[g][s]=h
                k=false
              end
            end
          end
        end
      end
    end

    #child2 in  2.yarısı
    child_2_array.each_with_index do |d,gun|
      d.each_with_index do |h,saat|
        unless h.nil?
          if child2.genes[gun][saat].nil? 
            child2.genes[gun][saat]=h
          #boş değilse çakışma var
          else
            #rasgele boş yere koy
            k=true
            while k
              g=rand(day)
              s=rand(hr)
              if child2.genes[g][s].nil?
                child2.genes[g][s]=h
                k=false
              end
            end
          end
        end
      end
    end

  
    return child1,child2

    #birey_P1 = birey[0, day/2]
    #birey_P2 = birey[day/2..-1]
    #birey2_P1 = birey2[0, day/2]
    #birey2_P2 = birey2[day/2..-1]
    #child1.genes=birey_P1+birey2_P2
    #child2.genes=birey2_P1+birey_P2
    #return child1,child2
  end

  def mutation(mRate)
    #  iki boyutlu dizide rasgele bir elemanı cirruculumdan başka bir eleman ile değiştir.
    #genes deki bütün id ler bi listeye koy .rand() ile rasgele birini seç ve on ait  dersleri başka yere koy
    if rand<mRate
      day=Day.all.size
      hours=@@hour
      ranD1=rand(day)
      ranL1=rand(hours)
      ders=@genes[ranD1][ranL1]
      if !(ders.nil?)
        ranD2=rand(day)
        ranL2=rand(hours)
        ders2=@genes[ranD2][ranL2]
        @genes[ranD1][ranL1] = ders2
        @genes[ranD2][ranL2] = ders
      else
        mutation(mRate)
      end
    end

  end

  def fitness
    @score=0
    #temp=Hash.new
    #@genes.each_with_index do |gen,row|
     # gen.each_with_index do |modul,col|
      #  if temp[modul].nil?
       #   temp[modul] = 1
       # else
        #  temp[modul] += 1
        #end
      #end
    #end
    @genes.each_with_index do |gen,row|
      gen.each_with_index do |modul,col|
        if !(modul.blank?)
          #Aynı saatteki bütün dersleri bul
          ws = Weeklyschedule.where(day_id:row , lessonhour_id:col)
          cur=Curriculum.find(modul)
          curgrade=cur.departmentlesson.grade
          hour = Departmentlesson.find(cur.departmentlesson_id).hour_amount
          ws.each do |wc|
            #hoca çakışması kontrol
            wsc=wc.curriculum
            if cur.admin.id != wsc.admin.id
              @score = @score + 1
            end
            # elsif #Sınıf çakışması yoksa ve sınıf kontenjanı yetiorsa
            #    @score = @score + 1
            #Aynı sınıfın başka dersi varmı
            if cur.departmentlesson.grade != wsc.departmentlesson.grade
              @score = @score + 1
            end
            #Ders sayısı
            #if hour == temp[cur.id]
             # @score = @score +1
            #end
          end
        end
      end
    end
    return @score
  end
end
