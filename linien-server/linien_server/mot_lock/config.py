from dataclasses import dataclass


@dataclass(frozen=True)
class Stage1Config:
    v_start: float
    v_end: float
    duration: float


class Stage2Config:
    v_start: float
    v_end: float
    duration: float


@dataclass(frozen=True)
class Stage3Config:
    v_start: float
    v_end: float
    duration: float
    delay: float
    n_repeats: int
