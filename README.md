# ARION AAS DeepStream Demo

ONNX 기반 객체 탐지를 위한 간단한 DeepStream 데모입니다.

## 빠른 시작

```bash
# 저장소 클론
git clone https://github.com/mskim46/arion_aas_deepstream
cd arion_aas_deepstream

# 데모 실행
./run_demo.sh
```

## 기능

- **비디오 소스**: `samples/sample_720p.mp4`
- **AI 모델**: ONNX 기반 객체 탐지
  - 자동차 (Car)
  - 자전거 (Bicycle) 
  - 사람 (Person)
  - 도로 표지판 (Road Sign)
- **성능**: 230+ FPS
- **화면 출력**: 실시간 바운딩 박스 표시
- **무한 루프**: 비디오 자동 반복 재생

## 요구사항

- ARION AAS 시스템
- DeepStream 7.1 (`/opt/nvidia/deepstream/deepstream-7.1`)
- Ubuntu 22.04
- CUDA & TensorRT

## 파일 구조

```
arion_aas_deepstream/
├── run_demo.sh                    # 메인 실행 스크립트
├── samples/
│   └── sample_720p.mp4            # 테스트 비디오
├── configs/
│   ├── demo_config.txt            # DeepStream 메인 설정
│   └── config_infer_primary.txt   # 추론 모델 설정
└── README.md
```

## 사용법

### 기본 실행
```bash
./run_demo.sh
```

### 제어 명령어
- `q`: 종료
- `p`: 일시정지
- `r`: 재개
- `h`: 도움말
- `Ctrl+C`: 강제 종료

### 화면 조작
- **좌클릭**: 소스 확대 및 객체 세부정보 보기
- **우클릭**: 타일 디스플레이로 돌아가기

## 설정 수정

### 비디오 소스 변경
`configs/demo_config.txt`에서 `[source0]` 섹션 수정:
```ini
[source0]
type=3
uri=file:///path/to/your/video.mp4
```

### 출력 방식 변경
`configs/demo_config.txt`에서 `[sink0]` 섹션 수정:
```ini
[sink0]
type=1  # 1=FakeSink, 2=EglSink, 5=nvdrmvideosink
```

## 문제 해결

### 화면이 안 보이는 경우
- SSH 연결 시 X11 포워딩 확인: `ssh -X user@host`
- 디스플레이 환경 변수 확인: `echo $DISPLAY`

### 권한 오류
```bash
chmod +x run_demo.sh
```

### DeepStream 경로 오류
DeepStream이 다른 경로에 설치된 경우 `run_demo.sh`에서 `DEEPSTREAM_PATH` 수정

## 성능 정보

- **추론 속도**: 230+ FPS
- **메모리 사용량**: GPU 메모리 최적화
- **지원 해상도**: 720p (1280x720)
- **배치 크기**: 1 (실시간 처리 최적화)

## 라이선스

NVIDIA DeepStream SDK 라이선스를 따릅니다.

---

**ARION AAS 전용 DeepStream 테스트 환경** 