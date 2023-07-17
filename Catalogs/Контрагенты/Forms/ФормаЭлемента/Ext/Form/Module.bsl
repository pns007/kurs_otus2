﻿&НаКлиенте
&ИзменениеИКонтроль("ПриОткрытииВместо")
Процедура ot_ПриОткрытииВместо(Отказ)
	#Вставка
	Сообщить("Изменение в расширении вместо");
	#КонецВставки	
	
	// СтандартныеПодсистемы.Свойства
	УправлениеСвойствамиКлиент.ПослеЗагрузкиДополнительныхРеквизитов(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.Свойства
	
	ПодключитьОбработчикОжидания("Подключаемый_ПоказатьПредложениеИспользоватьПроверкуКонтрагентов", 0.1, Истина);
	
	ПодключитьОбработчикОжидания("Подключаемый_ОбновитьСведенияОВзаиморасчетахСКонтрагентом", 0.1, Истина);

	Если Не ПустаяСтрока(Объект.НаименованиеПолное) Тогда
		ОбновитьНаименованияАвтозаполнения();
	КонецЕсли;
	
	Если ПроверкаКонтрагентовПоИННКППВозможна Тогда
		// ИнтернетПоддержкаПользователей.РаботаСКонтрагентами
		ПроверкаКонтрагентовКлиент.ПриОткрытииКонтрагент(ЭтотОбъект);
		// Конец ИнтернетПоддержкаПользователей.РаботаСКонтрагентами
	КонецЕсли;
	
	// ИнтернетПоддержкаПользователей.Новости.ПриОткрытии
	ОбработкаНовостейКлиент.КонтекстныеНовости_ПриОткрытии(ЭтаФорма);
	// Конец ИнтернетПоддержкаПользователей.Новости.ПриОткрытии
	
	// ИнтернетПоддержкаПользователей.СПАРКРиски
	Если ПоказатьИнформациюСпарк(ЭтотОбъект) Тогда
		СПАРКРискиКлиент.ПриОткрытии(ЭтотОбъект, Объект);
	КонецЕсли;
	// Конец ИнтернетПоддержкаПользователей.СПАРКРиски
	
	НадежностьБанковКлиент.ПодключитьОбработчикПоказатьИнформациюНадежностьБанков(ЭтотОбъект);
	
	Если ДанныеМодифицированы Тогда
		Модифицированность = Истина;
	КонецЕсли;
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// ЭлектронноеВзаимодействие.ОбменСКонтрагентами
	ЭлектронноеВзаимодействиеБПКлиент.КомандыЭДО_ПриОткрытии(ЭтотОбъект);
	// Конец ЭлектронноеВзаимодействие.ОбменСКонтрагентами
	

КонецПроцедуры
