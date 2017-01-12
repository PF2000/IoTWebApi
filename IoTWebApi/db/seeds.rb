# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##########################################################################################
# rails db:seed 		-	Comando para carregar as seeds
# rails db:schema:dump	-	Comando para *REESCREVER* o schema.rb a partir da BD actual - cuidado!
# rails db:schema:load 	-	Comando para carregar o esquema da BD
# rails db:setup 		-	drop+create+seed?
##########################################################################################


Room.delete_all
Course.delete_all
Degree.delete_all
School.delete_all
Discipline.delete_all
Project.delete_all
SchoolClass.delete_all
SchoolYear.delete_all
Attach.delete_all
Summary.delete_all

puts ""
puts "######### Apagou com sucesso os dados anteriores ##########"
puts "############ Parte dos utilizadores comentada #############"

User.delete_all
Role.delete_all

@r1 = Role.create(name: 'Manager')
@r2 = Role.create(name: 'User')
@r3 = Role.create(name: 'Admin')

@r1.users.create(name: 'teste1', email: 'teste1@ipt.pt', surname: 'Pistolas', password:'teste1')
@r2.users.create(name: 'teste2', email: 'teste2@ipt.pt', surname: 'Guedes', password:'teste2')
@r3.users.create(name: 'teste3', email: 'teste3@ipt.pt', surname: 'Semedo', password:'teste3')

puts "#################### Adicionar escolas ####################"

@s1 = School.create(name:'Escola Superior de Tecnologia de Tomar',country:'Portugal',district:'Santarém',city:'Tomar',county:'Tomar',post_code:'2300',address_details:'')
@s2 = School.create(name:'Escola Superior de Gestão de Tomar',country:'Portugal',district:'Santarém',city:'Tomar',county:'Tomar',post_code:'2300',address_details:'')
@s3 = School.create(name:'Escola Superior de Tecnologia de Abrantes',country:'Portugal',district:'Santarém',city:'Tomar',county:'Tomar',post_code:'2300',address_details:'')

puts "####################  Adicionar salas  ####################"

@room1 = @s1.rooms.create(description:'A100',projector:false, seats:'25')
@room2 = @s1.rooms.create(description:'A101',projector:false, seats:'20')
@room3 = @s1.rooms.create(description:'A102',projector:false, seats:'24')
@room4 = @s1.rooms.create(description:'A103',projector:true, seats:'29')
@room5 = @s1.rooms.create(description:'A104',projector:false, seats:'25')
@room6 = @s1.rooms.create(description:'A105',projector:false, seats:'16')
@room7 = @s1.rooms.create(description:'A106',projector:false, seats:'17')
@room8 = @s1.rooms.create(description:'A107',projector:true, seats:'22')
@room9 = @s1.rooms.create(description:'A108',projector:false, seats:'17')
@room10 = @s1.rooms.create(description:'A109',projector:true, seats:'15')
@room11 = @s1.rooms.create(description:'A110',projector:false, seats:'20')
@room12 = @s1.rooms.create(description:'A111',projector:true, seats:'16')
@room13 = @s1.rooms.create(description:'A112',projector:true, seats:'18')
@room14 = @s1.rooms.create(description:'A113',projector:true, seats:'28')
@room15 = @s1.rooms.create(description:'A114',projector:true, seats:'24')
@room16 = @s1.rooms.create(description:'A115',projector:false, seats:'18')
@room17 = @s1.rooms.create(description:'A116',projector:true, seats:'17')
@room18 = @s1.rooms.create(description:'A117',projector:true, seats:'21')
@room19 = @s1.rooms.create(description:'A118',projector:true, seats:'30')
@room20 = @s1.rooms.create(description:'A119',projector:false, seats:'24')
@room21 = @s1.rooms.create(description:'A120',projector:false, seats:'23')
@room22 = @s1.rooms.create(description:'A121',projector:false, seats:'26')
@room23 = @s1.rooms.create(description:'A122',projector:false, seats:'17')
@room24 = @s1.rooms.create(description:'A123',projector:false, seats:'19')
@room25 = @s1.rooms.create(description:'A124',projector:false, seats:'18')
@room26 = @s1.rooms.create(description:'A125',projector:true, seats:'24')
@room27 = @s1.rooms.create(description:'A126',projector:true, seats:'23')
@room28 = @s1.rooms.create(description:'A127',projector:false, seats:'15')
@room29 = @s1.rooms.create(description:'A128',projector:false, seats:'16')
@room30 = @s1.rooms.create(description:'A129',projector:true, seats:'26')
@room31 = @s1.rooms.create(description:'A130',projector:false, seats:'24')
@room32 = @s1.rooms.create(description:'A131',projector:true, seats:'22')
@room33 = @s1.rooms.create(description:'A132',projector:false, seats:'26')
@room34 = @s1.rooms.create(description:'A133',projector:false, seats:'27')
@room35 = @s1.rooms.create(description:'A134',projector:false, seats:'15')
@room36 = @s1.rooms.create(description:'A135',projector:false, seats:'18')
@room37 = @s1.rooms.create(description:'A136',projector:false, seats:'24')
@room38 = @s1.rooms.create(description:'A137',projector:false, seats:'23')
@room39 = @s1.rooms.create(description:'A138',projector:true, seats:'17')
@room40 = @s1.rooms.create(description:'A139',projector:false, seats:'29')
@room41 = @s1.rooms.create(description:'A140',projector:false, seats:'24')
@room42 = @s1.rooms.create(description:'A141',projector:false, seats:'29')
@room43 = @s1.rooms.create(description:'A142',projector:false, seats:'29')
@room44 = @s1.rooms.create(description:'A143',projector:true, seats:'23')
@room45 = @s1.rooms.create(description:'A144',projector:true, seats:'30')
@room46 = @s1.rooms.create(description:'A145',projector:true, seats:'25')
@room47 = @s1.rooms.create(description:'A146',projector:true, seats:'18')
@room48 = @s1.rooms.create(description:'A147',projector:false, seats:'24')
@room49 = @s2.rooms.create(description:'A147',projector:false, seats:'29')
@room50 = @s2.rooms.create(description:'A148',projector:true, seats:'30')
@room51 = @s2.rooms.create(description:'A149',projector:false, seats:'21')
@room52 = @s2.rooms.create(description:'A150',projector:false, seats:'30')
@room53 = @s2.rooms.create(description:'A151',projector:true, seats:'15')
@room54 = @s2.rooms.create(description:'A152',projector:false, seats:'17')
@room55 = @s2.rooms.create(description:'A153',projector:true, seats:'15')
@room56 = @s2.rooms.create(description:'A154',projector:false, seats:'28')
@room57 = @s2.rooms.create(description:'A155',projector:true, seats:'16')
@room58 = @s2.rooms.create(description:'A156',projector:false, seats:'25')
@room59 = @s2.rooms.create(description:'A157',projector:true, seats:'15')
@room60 = @s2.rooms.create(description:'A158',projector:false, seats:'27')
@room61 = @s2.rooms.create(description:'A159',projector:false, seats:'17')
@room62 = @s2.rooms.create(description:'A160',projector:false, seats:'15')
@room63 = @s2.rooms.create(description:'A161',projector:false, seats:'28')
@room64 = @s2.rooms.create(description:'A162',projector:false, seats:'24')
@room65 = @s2.rooms.create(description:'A163',projector:false, seats:'25')
@room66 = @s2.rooms.create(description:'A164',projector:false, seats:'29')
@room67 = @s2.rooms.create(description:'A165',projector:true, seats:'18')
@room68 = @s2.rooms.create(description:'A166',projector:false, seats:'20')
@room69 = @s2.rooms.create(description:'A167',projector:false, seats:'28')
@room70 = @s2.rooms.create(description:'A168',projector:true, seats:'15')
@room71 = @s2.rooms.create(description:'A169',projector:false, seats:'16')
@room72 = @s2.rooms.create(description:'A170',projector:false, seats:'21')
@room73 = @s2.rooms.create(description:'A171',projector:true, seats:'29')
@room74 = @s2.rooms.create(description:'A172',projector:true, seats:'19')
@room75 = @s2.rooms.create(description:'A173',projector:true, seats:'22')
@room76 = @s2.rooms.create(description:'A174',projector:false, seats:'26')
@room77 = @s2.rooms.create(description:'A175',projector:true, seats:'22')
@room78 = @s2.rooms.create(description:'A176',projector:true, seats:'21')
@room79 = @s2.rooms.create(description:'A177',projector:true, seats:'17')
@room80 = @s2.rooms.create(description:'A178',projector:true, seats:'19')
@room81 = @s2.rooms.create(description:'A179',projector:false, seats:'24')
@room82 = @s2.rooms.create(description:'A180',projector:true, seats:'15')
@room83 = @s2.rooms.create(description:'A181',projector:true, seats:'19')
@room84 = @s2.rooms.create(description:'A182',projector:false, seats:'20')
@room85 = @s2.rooms.create(description:'A183',projector:true, seats:'20')
@room86 = @s2.rooms.create(description:'A184',projector:false, seats:'23')
@room87 = @s2.rooms.create(description:'A185',projector:true, seats:'28')
@room88 = @s2.rooms.create(description:'A186',projector:false, seats:'28')
@room89 = @s2.rooms.create(description:'A187',projector:false, seats:'20')
@room90 = @s2.rooms.create(description:'A188',projector:false, seats:'18')
@room91 = @s2.rooms.create(description:'A189',projector:true, seats:'29')
@room92 = @s2.rooms.create(description:'A190',projector:false, seats:'25')
@room93 = @s2.rooms.create(description:'A191',projector:true, seats:'22')
@room94 = @s2.rooms.create(description:'A192',projector:true, seats:'18')
@room95 = @s2.rooms.create(description:'A193',projector:false, seats:'29')
@room96 = @s2.rooms.create(description:'A194',projector:false, seats:'23')
@room97 = @s2.rooms.create(description:'A195',projector:true, seats:'30')
@room98 = @s2.rooms.create(description:'A196',projector:true, seats:'16')
@room99 = @s2.rooms.create(description:'A197',projector:true, seats:'22')
@room100 = @s2.rooms.create(description:'A198',projector:true, seats:'15')
@room101 = @s2.rooms.create(description:'A199',projector:true, seats:'16')
@room102 = @s2.rooms.create(description:'A200',projector:false, seats:'18')
@room103 = @s2.rooms.create(description:'A201',projector:true, seats:'15')
@room104 = @s3.rooms.create(description:'A147',projector:true, seats:'21')
@room105 = @s3.rooms.create(description:'A148',projector:true, seats:'15')
@room106 = @s3.rooms.create(description:'A149',projector:true, seats:'20')
@room107 = @s3.rooms.create(description:'A150',projector:true, seats:'19')
@room108 = @s3.rooms.create(description:'A151',projector:true, seats:'24')
@room109 = @s3.rooms.create(description:'A152',projector:true, seats:'19')
@room110 = @s3.rooms.create(description:'A153',projector:false, seats:'29')
@room111 = @s3.rooms.create(description:'A154',projector:false, seats:'20')
@room112 = @s3.rooms.create(description:'A155',projector:true, seats:'18')
@room113 = @s3.rooms.create(description:'A156',projector:true, seats:'30')
@room114 = @s3.rooms.create(description:'A157',projector:false, seats:'22')
@room115 = @s3.rooms.create(description:'A158',projector:true, seats:'21')
@room116 = @s3.rooms.create(description:'A159',projector:false, seats:'29')
@room117 = @s3.rooms.create(description:'A160',projector:false, seats:'26')
@room118 = @s3.rooms.create(description:'A161',projector:true, seats:'20')
@room119 = @s3.rooms.create(description:'A162',projector:false, seats:'20')
@room120 = @s3.rooms.create(description:'A163',projector:true, seats:'15')
@room121 = @s3.rooms.create(description:'A164',projector:true, seats:'15')
@room122 = @s3.rooms.create(description:'A165',projector:false, seats:'24')
@room123 = @s3.rooms.create(description:'A166',projector:false, seats:'27')
@room124 = @s3.rooms.create(description:'A167',projector:false, seats:'19')
@room125 = @s3.rooms.create(description:'A168',projector:false, seats:'21')
@room126 = @s3.rooms.create(description:'A169',projector:false, seats:'24')
@room127 = @s3.rooms.create(description:'A170',projector:true, seats:'26')
@room128 = @s3.rooms.create(description:'A171',projector:false, seats:'28')
@room129 = @s3.rooms.create(description:'A172',projector:false, seats:'22')
@room130 = @s3.rooms.create(description:'A173',projector:true, seats:'22')
@room131 = @s3.rooms.create(description:'A174',projector:true, seats:'22')
@room132 = @s3.rooms.create(description:'A175',projector:false, seats:'26')
@room133 = @s3.rooms.create(description:'A176',projector:true, seats:'23')
@room134 = @s3.rooms.create(description:'A177',projector:false, seats:'25')
@room135 = @s3.rooms.create(description:'A178',projector:true, seats:'27')
@room136 = @s3.rooms.create(description:'A179',projector:false, seats:'18')
@room137 = @s3.rooms.create(description:'A180',projector:false, seats:'16')
@room138 = @s3.rooms.create(description:'A181',projector:false, seats:'16')
@room139 = @s3.rooms.create(description:'A182',projector:true, seats:'23')
@room140 = @s3.rooms.create(description:'A183',projector:true, seats:'18')
@room141 = @s3.rooms.create(description:'A184',projector:false, seats:'22')
@room142 = @s3.rooms.create(description:'A185',projector:false, seats:'16')
@room143 = @s3.rooms.create(description:'A186',projector:false, seats:'23')
@room144 = @s3.rooms.create(description:'A187',projector:false, seats:'27')
@room145 = @s3.rooms.create(description:'A188',projector:false, seats:'22')
@room146 = @s3.rooms.create(description:'A189',projector:true, seats:'21')
@room147 = @s3.rooms.create(description:'A190',projector:true, seats:'18')
@room148 = @s3.rooms.create(description:'A191',projector:false, seats:'22')
@room149 = @s3.rooms.create(description:'A192',projector:false, seats:'26')
@room150 = @s3.rooms.create(description:'A193',projector:true, seats:'16')
@room151 = @s3.rooms.create(description:'A194',projector:true, seats:'30')
@room152 = @s3.rooms.create(description:'A195',projector:true, seats:'19')
@room153 = @s3.rooms.create(description:'A196',projector:true, seats:'15')
@room154 = @s3.rooms.create(description:'A197',projector:false, seats:'23')
@room155 = @s3.rooms.create(description:'A198',projector:false, seats:'17')
@room156 = @s3.rooms.create(description:'A199',projector:false, seats:'17')
@room157 = @s3.rooms.create(description:'A200',projector:false, seats:'19')
@room158 = @s3.rooms.create(description:'A201',projector:true, seats:'30')

puts "############### Adicionar Níveis de cursos ################"

@r1 = Degree.create(description:'TeSP')
@r2 = Degree.create(description:'Licenciatura')
@r3 = Degree.create(description:'Mestrado')
@r4 = Degree.create(description:'Doutoramento')
@r5 = Degree.create(description:'Pós-Graduação')

puts "################ Adicionar anos lectivos ##################"

@SchoolYear1 = SchoolYear.create(description:'2005/2006',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear2 = SchoolYear.create(description:'2006/2007',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear3 = SchoolYear.create(description:'2007/2008',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear4 = SchoolYear.create(description:'2008/2009',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear5 = SchoolYear.create(description:'2009/2010',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear6 = SchoolYear.create(description:'2010/2011',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear7 = SchoolYear.create(description:'2011/2012',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear8 = SchoolYear.create(description:'2012/2013',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear9 = SchoolYear.create(description:'2013/2014',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear10 = SchoolYear.create(description:'2014/2015',start_time:DateTime.now,end_time:DateTime.now)
@SchoolYear11 = SchoolYear.create(description:'2015/2016',start_time:DateTime.now,end_time:DateTime.now)

puts "#################### Adicionar  cursos ####################"

@course1 = @s1.courses.create(name:'Administração de Bases de Dados',degree:@r1)
@course2 = @s1.courses.create(name:'Animação e Modelação 3D',degree:@r1)
@course3 = @s1.courses.create(name:'Arte e Técnica do Couro',degree:@r1)
@course4 = @s1.courses.create(name:'Automação Industrial',degree:@r1)
@course5 = @s1.courses.create(name:'Construção e Reabilitação',degree:@r1)
@course6 = @s1.courses.create(name:'Contabilidade e Fiscalidade',degree:@r1)
@course7 = @s1.courses.create(name:'Contabilidade e Gestão',degree:@r1)
@course8 = @s1.courses.create(name:'Desenho Tecnológico',degree:@r1)
@course9 = @s1.courses.create(name:'Desenho e Fabrico de Construções Mecânicas',degree:@r1)
@course10 = @s1.courses.create(name:'Design Multimédia',degree:@r1)
@course11 = @s1.courses.create(name:'Gestão Administrativa de Recursos Humanos',degree:@r1)
@course12 = @s1.courses.create(name:'Gestão Comercial e Vendas',degree:@r1)
@course13 = @s1.courses.create(name:'Instalações Elétricas e Manutenção Industrial',degree:@r1)
@course14 = @s1.courses.create(name:'Manutenção de Sistemas Mecatrónicos',degree:@r1)
@course15 = @s1.courses.create(name:'Produção Artística para a Conservação e Restauro',degree:@r1)
@course16 = @s1.courses.create(name:'Produção de Atividades para o Turismo Cultural',degree:@r1)
@course17 = @s1.courses.create(name:'Qualidade Alimentar',degree:@r1)
@course18 = @s1.courses.create(name:'Qualidade Ambiental',degree:@r1)
@course19 = @s1.courses.create(name:'Segurança e Proteção Civil',degree:@r1)
@course20 = @s1.courses.create(name:'Som e Imagem',degree:@r1)
@course21 = @s1.courses.create(name:'Tecnologia de Bioprocessos',degree:@r1)
@course22 = @s1.courses.create(name:'Tecnologia e Programação em Sistemas de Informação',degree:@r1)
@course23 = @s1.courses.create(name:'Tecnologias Tradicionais de Construção e Reabilitação',degree:@r1)
@course24 = @s1.courses.create(name:'Web e Dispositivos Móveis',degree:@r1)
@course25 = @s1.courses.create(name:'Administração Pública',degree:@r2)
@course26 = @s1.courses.create(name:'Artes Plásticas - Pintura e Intermédia',degree:@r2)
@course27 = @s1.courses.create(name:'Auditoria e Fiscalidade',degree:@r2)
@course28 = @s1.courses.create(name:'Comunicação Social',degree:@r2)
@course29 = @s1.courses.create(name:'Conservação e Restauro',degree:@r2)
@course30 = @s1.courses.create(name:'Construção e Reabilitação',degree:@r2)
@course31 = @s1.courses.create(name:'Contabilidade',degree:@r2)
@course32 = @s1.courses.create(name:'Design e Tecnologia das Artes Gráficas',degree:@r2)
@course33 = @s1.courses.create(name:'Engenharia Civil (pós-laboral)',degree:@r2)
@course34 = @s1.courses.create(name:'Engenharia Civil',degree:@r2)
@course35 = @s1.courses.create(name:'Engenharia Electrotécnica e de Computadores (pós-laboral)',degree:@r2)
@course36 = @s1.courses.create(name:'Engenharia Electrotécnica e de Computadores',degree:@r2)
@course37 = @s1.courses.create(name:'Engenharia Informática (pós-laboral)',degree:@r2)
@course38 = @s1.courses.create(name:'Engenharia Informática',degree:@r2)
@course39 = @s1.courses.create(name:'Engenharia Mecânica',degree:@r2)
@course40 = @s1.courses.create(name:'Engenharia Química e Bioquímica',degree:@r2)
@course41 = @s1.courses.create(name:'Engenharia do Ambiente e Biológica',degree:@r2)
@course42 = @s1.courses.create(name:'Fotografia',degree:@r2)
@course43 = @s1.courses.create(name:'Gestão Turística e Cultural',degree:@r2)
@course44 = @s1.courses.create(name:'Gestão de Empresas (pós-laboral)',degree:@r2)
@course45 = @s1.courses.create(name:'Gestão de Empresas',degree:@r2)
@course46 = @s1.courses.create(name:'Gestão de Recursos Humanos e Comportamento Organizacional',degree:@r2)
@course47 = @s1.courses.create(name:'Gestão do Território',degree:@r2)
@course48 = @s1.courses.create(name:'Gestão e Administração Bancária (Pós-Laboral)',degree:@r2)
@course49 = @s1.courses.create(name:'Gestão e Administração de Serviços de Saúde',degree:@r2)
@course50 = @s1.courses.create(name:'Tecnologias de Informação e Comunicação',degree:@r2)
@course51 = @s1.courses.create(name:'Video e Cinema Documental',degree:@r2)
@course52 = @s1.courses.create(name:'Analítica e Inteligência Organizacional',degree:@r3)
@course53 = @s1.courses.create(name:'Arqueologia Pré-Histórica a Arte Rupestre',degree:@r3)
@course54 = @s1.courses.create(name:'Auditoria e Análise Financeira',degree:@r3)
@course55 = @s1.courses.create(name:'Auditoria e Finanças',degree:@r3)
@course56 = @s1.courses.create(name:'Conservação e Restauro',degree:@r3)
@course57 = @s1.courses.create(name:'Desenvolvimento de Produtos de Turismo Cultural',degree:@r3)
@course58 = @s1.courses.create(name:'Design Editorial',degree:@r3)
@course59 = @s1.courses.create(name:'Engenharia Eletrotécnica - Especialização em Controlo e Eletrónica Industrial',degree:@r3)
@course60 = @s1.courses.create(name:'Engenharia Informática - Internet das Coisas',degree:@r3)
@course61 = @s1.courses.create(name:'Engenharia Mecânica - Projecto e Produção Mecânica',degree:@r3)
@course62 = @s1.courses.create(name:'Fotografia',degree:@r3)
@course63 = @s1.courses.create(name:'Gestão de Empresas Familiares e Empreendedorismo',degree:@r3)
@course64 = @s1.courses.create(name:'Gestão de Recursos de Saúde',degree:@r3)
@course65 = @s1.courses.create(name:'Informática na Saúde (pós-laboral)',degree:@r3)
@course66 = @s1.courses.create(name:'Inovação e Desenvolvimento Empreendedor',degree:@r3)
@course67 = @s1.courses.create(name:'Manutenção de Instalações Técnicas',degree:@r3)
@course68 = @s1.courses.create(name:'Museus, Património e Sociedade do Conhecimento',degree:@r3)
@course69 = @s1.courses.create(name:'Produção de Conteúdos Digitais',degree:@r3)
@course70 = @s1.courses.create(name:'Reabilitação Urbana',degree:@r3)
@course71 = @s1.courses.create(name:'Sistemas de Informação Geográfica, em Planeamento e Gestão do Território',degree:@r3)
@course72 = @s1.courses.create(name:'Tecnologia Quimica',degree:@r3)
@course73 = @s1.courses.create(name:'Técnicas de Arqueologia',degree:@r3)
@course74 = @s1.courses.create(name:'Executive Master em Gestão de Organizações Sem Fins Lucrativos',degree:@r5)
@course75 = @s1.courses.create(name:'Executive Master em Gestão para Empreendedores e Executivos',degree:@r5)
@course76 = @s1.courses.create(name:'Análise e Tratamento Computacional de Dados',degree:@r5)
@course77 = @s1.courses.create(name:'Arqueologia Subaquática',degree:@r5)
@course78 = @s1.courses.create(name:'Arqueologia, Gestão e Educação Patrimonial',degree:@r5)
@course79 = @s1.courses.create(name:'Business Intelligence',degree:@r5)
@course80 = @s1.courses.create(name:'Design Multimédia',degree:@r5)
@course81 = @s1.courses.create(name:'Gestão de Informação e do Conhecimento',degree:@r5)
@course82 = @s1.courses.create(name:'Jornalismo de Proximidade',degree:@r5)
@course83 = @s1.courses.create(name:'Marketing Territorial',degree:@r5)
@course84 = @s1.courses.create(name:'Produção Industrial',degree:@r5)
@course85 = @s1.courses.create(name:'Proteção Civil: A Gestão da Comunicação no Risco, nas Emergências e nas Crises',degree:@r5)
@course86 = @s1.courses.create(name:'Pós-graduação em Novas Tecnologias da Comunicação',degree:@r5)

puts "############# Ligação - Courses / SchoolYears #############"

@course1.school_years << @SchoolYear1
@course2.school_years << @SchoolYear2
@course3.school_years << @SchoolYear3
@course4.school_years << @SchoolYear4
@course5.school_years << @SchoolYear5
@course6.school_years << @SchoolYear6
@course7.school_years << @SchoolYear7
@course8.school_years << @SchoolYear8
@course9.school_years << @SchoolYear9
@course10.school_years << @SchoolYear10
@course11.school_years << @SchoolYear11
@course12.school_years << @SchoolYear1
@course13.school_years << @SchoolYear2
@course14.school_years << @SchoolYear3
@course15.school_years << @SchoolYear4
@course16.school_years << @SchoolYear5
@course17.school_years << @SchoolYear6
@course18.school_years << @SchoolYear7
@course19.school_years << @SchoolYear8
@course20.school_years << @SchoolYear9
@course21.school_years << @SchoolYear10
@course22.school_years << @SchoolYear11
@course23.school_years << @SchoolYear1
@course24.school_years << @SchoolYear2
@course25.school_years << @SchoolYear3
@course26.school_years << @SchoolYear4
@course27.school_years << @SchoolYear5
@course28.school_years << @SchoolYear6
@course29.school_years << @SchoolYear7
@course30.school_years << @SchoolYear8


puts "################## Adicionar  disciplina ##################"

@discipline1 = Discipline.create(name:'Álgebra')
@discipline2 = Discipline.create(name:'Introdução à Programação')
@discipline3 = Discipline.create(name:'Introdução à Tecnologia')
@discipline4 = Discipline.create(name:'Sistemas Digitais')
@discipline5 = Discipline.create(name:'Análise Matemática II')
@discipline6 = Discipline.create(name:'Introdução à Electrónica Digital')
@discipline7 = Discipline.create(name:'Lógica e Computação')
@discipline8 = Discipline.create(name:'Programação Orientada a Objectos')
@discipline9 = Discipline.create(name:'Tecnologias da Internet I')
@discipline10 = Discipline.create(name:'Análise Matemática I')
@discipline11 = Discipline.create(name:'Arquitectura de Computadores I')
@discipline12 = Discipline.create(name:'Bases de Dados I')
@discipline13 = Discipline.create(name:'Estruturas de Dados e Algoritmos')
@discipline14 = Discipline.create(name:'Introdução às Telecomunicações')
@discipline15 = Discipline.create(name:'Probabilidades e Estatística')
@discipline16 = Discipline.create(name:'Bases de Dados II')
@discipline17 = Discipline.create(name:'Microprocessadores')
@discipline18 = Discipline.create(name:'Redes de Dados I')
@discipline19 = Discipline.create(name:'Sistemas Operativos')
@discipline20 = Discipline.create(name:'Tecnologias da Internet II')
@discipline21 = Discipline.create(name:'Análise de Sistemas')
@discipline22 = Discipline.create(name:'Arquitectura de Computadores II')
@discipline23 = Discipline.create(name:'Gestão e Segurança de Redes Informáticas')
@discipline24 = Discipline.create(name:'Redes de Dados II')
@discipline25 = Discipline.create(name:'Sistemas Distribuídos')
@discipline26 = Discipline.create(name:'Empreendedorismo')
@discipline27 = Discipline.create(name:'Projecto de Redes')
@discipline28 = Discipline.create(name:'Projecto de Sistemas de Informação')
@discipline29 = Discipline.create(name:'Projecto Final')
@discipline30 = Discipline.create(name:'Sistemas de Informação nas Organizações')

puts "############# Ligação - Courses / Disciplines #############"

@course38.disciplines << @discipline1
@course38.disciplines << @discipline2
@course38.disciplines << @discipline3
@course38.disciplines << @discipline4
@course38.disciplines << @discipline5
@course38.disciplines << @discipline6
@course38.disciplines << @discipline7
@course38.disciplines << @discipline8
@course38.disciplines << @discipline9
@course38.disciplines << @discipline10
@course38.disciplines << @discipline11
@course38.disciplines << @discipline12
@course38.disciplines << @discipline13
@course38.disciplines << @discipline14
@course38.disciplines << @discipline15
@course38.disciplines << @discipline16
@course38.disciplines << @discipline17
@course38.disciplines << @discipline18
@course38.disciplines << @discipline19
@course38.disciplines << @discipline20
@course38.disciplines << @discipline21
@course38.disciplines << @discipline22
@course38.disciplines << @discipline23
@course38.disciplines << @discipline24
@course38.disciplines << @discipline25
@course38.disciplines << @discipline26
@course38.disciplines << @discipline27
@course38.disciplines << @discipline28
@course38.disciplines << @discipline29
@course38.disciplines << @discipline30

puts "##################### Adicionar projectos #################"

@project1 = Project.create(name:'Prj1',description:'Descr Proj 1',grade:10,discipline:@discipline1,school_year:@SchoolYear1)
@project2 = Project.create(name:'Prj2',description:'Descr Proj 2',grade:10,discipline:@discipline2,school_year:@SchoolYear2)
@project3 = Project.create(name:'Prj3',description:'Descr Proj 3',grade:10,discipline:@discipline3,school_year:@SchoolYear3)
@project4 = Project.create(name:'Prj4',description:'Descr Proj 4',grade:10,discipline:@discipline4,school_year:@SchoolYear4)
@project5 = Project.create(name:'Prj5',description:'Descr Proj 5',grade:10,discipline:@discipline5,school_year:@SchoolYear5)
@project6 = Project.create(name:'Prj6',description:'Descr Proj 6',grade:10,discipline:@discipline6,school_year:@SchoolYear6)
@project7 = Project.create(name:'Prj7',description:'Descr Proj 7',grade:10,discipline:@discipline7,school_year:@SchoolYear7)
@project8 = Project.create(name:'Prj8',description:'Descr Proj 8',grade:10,discipline:@discipline8,school_year:@SchoolYear8)
@project9 = Project.create(name:'Prj9',description:'Descr Proj 9',grade:10,discipline:@discipline9,school_year:@SchoolYear9)
@project10 = Project.create(name:'Prj10',description:'Descr Proj 10',grade:10,discipline:@discipline10,school_year:@SchoolYear10)
@project11 = Project.create(name:'Prj11',description:'Descr Proj 11',grade:10,discipline:@discipline11,school_year:@SchoolYear11)

puts "##################### Adicionar 'anexos' #################"

#puts @project1.inspect

@attach1 = Attach.create(name:'attach1',description:'Desc attach 1',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project1,data_type:'jpg')
@attach2 = Attach.create(name:'attach2',description:'Desc attach 2',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project2,data_type:'jpg')
@attach3 = Attach.create(name:'attach3',description:'Desc attach 3',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project3,data_type:'jpg')
@attach4 = Attach.create(name:'attach4',description:'Desc attach 4',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project4,data_type:'jpg')
@attach5 = Attach.create(name:'attach5',description:'Desc attach 5',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project5,data_type:'jpg')
@attach6 = Attach.create(name:'attach6',description:'Desc attach 6',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project6,data_type:'jpg')
@attach7 = Attach.create(name:'attach7',description:'Desc attach 7',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project7,data_type:'jpg')
@attach8 = Attach.create(name:'attach8',description:'Desc attach 8',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project8,data_type:'jpg')
@attach9 = Attach.create(name:'attach9',description:'Desc attach 9',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project9,data_type:'jpg')
@attach10 = Attach.create(name:'attach10',description:'Desc attach 10',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project10,data_type:'jpg')
@attach11 = Attach.create(name:'attach11',description:'Desc attach 11',data:'jhgfjegfegrglerhgr+ir+qerg',project:@project11,data_type:'jpg')

puts "####################### Adicionar Aulas ###################"
	
@SchoolClass1 = SchoolClass.create(description:'SchoolClass1',start_time:DateTime.now,end_time:DateTime.now,class_letter:'A',class_type:'T',professor:'Prof1',room:@room1,discipline:@discipline1,school_year:@SchoolYear1)
@SchoolClass2 = SchoolClass.create(description:'SchoolClass2',start_time:DateTime.now,end_time:DateTime.now,class_letter:'A',class_type:'T',professor:'Prof2',room:@room2,discipline:@discipline2,school_year:@SchoolYear2)
@SchoolClass3 = SchoolClass.create(description:'SchoolClass3',start_time:DateTime.now,end_time:DateTime.now,class_letter:'A',class_type:'T+TP',professor:'Prof3',room:@room3,discipline:@discipline3,school_year:@SchoolYear3)
@SchoolClass4 = SchoolClass.create(description:'SchoolClass4',start_time:DateTime.now,end_time:DateTime.now,class_letter:'B',class_type:'T',professor:'Prof4',room:@room4,discipline:@discipline4,school_year:@SchoolYear4)
@SchoolClass5 = SchoolClass.create(description:'SchoolClass5',start_time:DateTime.now,end_time:DateTime.now,class_letter:'B',class_type:'T',professor:'Prof5',room:@room5,discipline:@discipline5,school_year:@SchoolYear5)
@SchoolClass6 = SchoolClass.create(description:'SchoolClass6',start_time:DateTime.now,end_time:DateTime.now,class_letter:'B',class_type:'T+TP',professor:'Prof6',room:@room6,discipline:@discipline6,school_year:@SchoolYear6)
@SchoolClass7 = SchoolClass.create(description:'SchoolClass7',start_time:DateTime.now,end_time:DateTime.now,class_letter:'C',class_type:'T',professor:'Prof7',room:@room7,discipline:@discipline7,school_year:@SchoolYear7)
@SchoolClass8 = SchoolClass.create(description:'SchoolClass8',start_time:DateTime.now,end_time:DateTime.now,class_letter:'C',class_type:'T',professor:'Prof8',room:@room8,discipline:@discipline8,school_year:@SchoolYear8)
@SchoolClass9 = SchoolClass.create(description:'SchoolClass9',start_time:DateTime.now,end_time:DateTime.now,class_letter:'C',class_type:'T+TP',professor:'Prof9',room:@room9,discipline:@discipline9,school_year:@SchoolYear9)
@SchoolClass10 = SchoolClass.create(description:'SchoolClass10',start_time:DateTime.now,end_time:DateTime.now,class_letter:'D',class_type:'T',professor:'Prof10',room:@room10,discipline:@discipline10,school_year:@SchoolYear10)
@SchoolClass11 = SchoolClass.create(description:'SchoolClass11',start_time:DateTime.now,end_time:DateTime.now,class_letter:'D',class_type:'T+TP',professor:'Prof11',room:@room11,discipline:@discipline11,school_year:@SchoolYear11)

puts "################### Adicionar summaries ###################"

@summary1 = Summary.create(number_students:'29', date: DateTime.now + rand(-10..10), description:'Summary1',school_class:@SchoolClass1)
@summary2 = Summary.create(number_students:'27', date: DateTime.now + rand(-10..10), description:'Summary2',school_class:@SchoolClass2)
@summary3 = Summary.create(number_students:'20', date: DateTime.now + rand(-10..10), description:'Summary3',school_class:@SchoolClass3)
@summary4 = Summary.create(number_students:'28', date: DateTime.now + rand(-10..10), description:'Summary4',school_class:@SchoolClass4)
@summary5 = Summary.create(number_students:'27', date: DateTime.now + rand(-10..10), description:'Summary5',school_class:@SchoolClass5)
@summary6 = Summary.create(number_students:'30', date: DateTime.now + rand(-10..10), description:'Summary6',school_class:@SchoolClass6)
@summary7 = Summary.create(number_students:'18', date: DateTime.now + rand(-10..10), description:'Summary7',school_class:@SchoolClass7)
@summary8 = Summary.create(number_students:'20', date: DateTime.now + rand(-10..10), description:'Summary8',school_class:@SchoolClass8)
@summary9 = Summary.create(number_students:'17', date: DateTime.now + rand(-10..10), description:'Summary9',school_class:@SchoolClass9)
@summary10 = Summary.create(number_students:'23', date: DateTime.now + rand(-10..10), description:'Summary10',school_class:@SchoolClass10)
@summary11 = Summary.create(number_students:'15', date: DateTime.now + rand(-10..10), description:'Summary11',school_class:@SchoolClass11)


puts "################## Carregado com sucesso ##################"

####[Role.seed(:user)])teste

####### DEBUG TIME #######
#puts @r1.course.to_yaml
#puts @r1.course.inspect
#puts @s1.courses.inspect