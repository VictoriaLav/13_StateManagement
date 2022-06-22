enum PatternEnum {
  simpleStateManagement,
  flutterRiverpod,
  hooksRiverpod,
  flutterBlocWithBloc,
  flutterBlocWithCubit,
  bloc,
  redux,
  mobx
}

class Pattern {
  final PatternEnum type;
  final String name;

  const Pattern({required this.type, required this.name});
}

const List<Pattern> listPattern = [
  Pattern(type: PatternEnum.simpleStateManagement, name: 'Simple state management'),
  Pattern(type: PatternEnum.flutterRiverpod, name: 'flutter_riverpod'),
  Pattern(type: PatternEnum.hooksRiverpod, name: 'hooks_riverpod'),
  Pattern(type: PatternEnum.flutterBlocWithBloc, name: 'flutter_bloc with BloC'),
  Pattern(type: PatternEnum.flutterBlocWithCubit, name: 'flutter_bloc with Cubit'),
  Pattern(type: PatternEnum.bloc, name: 'Bloc'),
  Pattern(type: PatternEnum.redux, name: 'Redux'),
  Pattern(type: PatternEnum.mobx, name: 'MobX'),
];
